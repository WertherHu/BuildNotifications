﻿using System;
using System.Threading.Tasks;
using BuildNotifications.Core.Config;
using BuildNotifications.Core.Pipeline;
using BuildNotifications.Core.Pipeline.Notification.Distribution;
using BuildNotifications.Core.Pipeline.Tree;
using BuildNotifications.Core.Plugin;
using BuildNotifications.Core.Plugin.Host;
using BuildNotifications.Core.Utilities;
using BuildNotifications.PluginInterfaces.Host;
using NLog.Fluent;

namespace BuildNotifications.Core
{
    public class CoreSetup
    {
        public CoreSetup(IPathResolver pathResolver, IDistributedNotificationReceiver? notificationReceiver, IDispatcher uiDispatcher)
        {
            _pathResolver = pathResolver;
            var serializer = new Serializer();

            var pluginHost = new PluginHost(uiDispatcher);
            var pluginLoader = new PluginLoader(pluginHost);
            PluginRepository = pluginLoader.LoadPlugins(pathResolver.PluginFolders);

            _configurationSerializer = new ConfigurationSerializer(serializer);
            ConfigurationBuilder = new ConfigurationBuilder(_pathResolver, _configurationSerializer);
            Configuration = ConfigurationBuilder.LoadConfiguration();

            ProjectProvider = new ProjectProvider(Configuration, PluginRepository);

            UserIdentityList = new UserIdentityList();

            var searcher = new BuildSearcher();
            var treeBuilder = new TreeBuilder(Configuration, searcher);
            Pipeline = new Pipeline.Pipeline(treeBuilder, Configuration, UserIdentityList);

            Pipeline.Notifier.Updated += Notifier_Updated;

            if (notificationReceiver != null)
            {
                NotificationReceiver = notificationReceiver;
                NotificationReceiver.DistributedNotificationReceived += (sender, args) => DistributedNotificationReceived?.Invoke(this, args);
            }
        }

        public IConfiguration Configuration { get; }

        public ConfigurationBuilder ConfigurationBuilder { get; }

        public IDistributedNotificationReceiver? NotificationReceiver { get; }

        public IPipeline Pipeline { get; }

        public IPluginRepository PluginRepository { get; }

        public IProjectProvider ProjectProvider { get; }

        public IUserIdentityList UserIdentityList { get; }

        public event EventHandler<DistributedNotificationReceivedEventArgs>? DistributedNotificationReceived;

        public event EventHandler<PipelineUpdateEventArgs>? PipelineUpdated;

        public void PersistConfigurationChanges()
        {
            var configFilePath = _pathResolver.UserConfigurationFilePath;
            Log.Info().Message($"Persisting configuration to path {configFilePath}").Write();
            _configurationSerializer.Save(Configuration, configFilePath);
        }

        public Task Update(UpdateModes mode) => Pipeline.Update(mode);

        private void Notifier_Updated(object? sender, PipelineUpdateEventArgs e)
        {
            PipelineUpdated?.Invoke(this, e);
        }

        private readonly IPathResolver _pathResolver;

        private readonly ConfigurationSerializer _configurationSerializer;
    }
}
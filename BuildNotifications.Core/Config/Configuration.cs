﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Anotar.NLog;
using BuildNotifications.Core.Pipeline.Tree.Arrangement;
using BuildNotifications.Core.Plugin;
using BuildNotifications.PluginInterfaces;
using JetBrains.Annotations;
using Newtonsoft.Json;
using ReflectSettings.Attributes;

namespace BuildNotifications.Core.Config
{
    internal class Configuration : IConfiguration
    {
        public Configuration()
        {
            GroupDefinition = new BuildTreeGroupDefinition(
                Pipeline.Tree.Arrangement.GroupDefinition.Source,
                Pipeline.Tree.Arrangement.GroupDefinition.Branch,
                Pipeline.Tree.Arrangement.GroupDefinition.BuildDefinition);
        }

        [TypesForInstantiation(typeof(BuildTreeGroupDefinition))]
        public IBuildTreeGroupDefinition GroupDefinition { get; set; }

        [MinMax(1, int.MaxValue)]
        public int BuildsToLoadCount { get; set; } = 200;

        [MinMax(1, 10)]
        public int BuildsToShow { get; set; } = 5;

        [MinMax(30, int.MaxValue)]
        public int UpdateInterval { get; set; } = 30;

        public BuildNotificationMode CanceledBuildNotifyConfig { get; set; } = BuildNotificationMode.RequestedByMe;

        public BuildNotificationMode FailedBuildNotifyConfig { get; set; } = BuildNotificationMode.RequestedByMe;

        public BuildNotificationMode SucceededBuildNotifyConfig { get; set; } = BuildNotificationMode.RequestedByMe;

        [JsonIgnore]
        public CultureInfo Culture => CultureInfo.GetCultureInfo(Language);

        [CalculatedValues(nameof(PossibleLanguages))]
        public string Language { get; set; }

        [IgnoredForConfig]
        [JsonIgnore]
        public Func<IEnumerable<string>> PossibleBuildPluginsFunction { get; set; }

        [IgnoredForConfig]
        [JsonIgnore]
        public Func<IEnumerable<string>> PossibleSourceControlPluginsFunction { get; set; }

        [IgnoredForConfig]
        [JsonIgnore]
        public IPluginRepository PluginRepository { get; set; }

        public IEnumerable<string> PossibleBuildPlugins() => PossibleBuildPluginsFunction?.Invoke();

        public IEnumerable<string> PossibleSourceControlPlugins() => PossibleSourceControlPluginsFunction?.Invoke();

        public Type BuildPluginConfigurationType(ConnectionData connectionData)
        {
            if (PluginRepository == null)
                LogTo.Warn("PluginRepository not set on Configuration. Impossible to retrieve correct Configuration type for plugin.");
            var type = PluginRepository?.FindConfigurationType(connectionData.BuildPluginType);
            return type ?? typeof(object);
        }

        public Type SourceControlPluginConfigurationType(ConnectionData connectionData)
        {
            if (PluginRepository == null)
                LogTo.Warn("PluginRepository not set on Configuration. Impossible to retrieve correct Configuration type for plugin.");
            var type = PluginRepository?.FindConfigurationType(connectionData.SourceControlPluginType);
            return type ?? typeof(object);
        }

        [TypesForInstantiation(typeof(List<ConnectionData>))]
        [CalculatedValues(nameof(PossibleBuildPlugins), nameof(PossibleBuildPlugins))]
        [CalculatedValues(nameof(PossibleSourceControlPlugins), nameof(PossibleSourceControlPlugins))]
        [CalculatedType(nameof(BuildPluginConfigurationType), nameof(BuildPluginConfigurationType))]
        [CalculatedType(nameof(SourceControlPluginConfigurationType), nameof(SourceControlPluginConfigurationType))]
        public IList<ConnectionData> Connections { get; set; }

        public IEnumerable<string> ConnectionNames() => Connections.Select(x => x.Name);

        [UsedImplicitly]
        public IEnumerable<string> PossibleLanguages()
        {
            yield return "en-US";
            yield return "de";
        }

        [TypesForInstantiation(typeof(List<IProjectConfiguration>), typeof(ProjectConfiguration))]
        [CalculatedValues(nameof(ConnectionNames), nameof(ConnectionNames))]
        public IList<IProjectConfiguration> Projects { get; set; }

        [JsonIgnore]
        [IgnoredForConfig]
        public IList<IUser> IdentitiesOfCurrentUser { get; } = new List<IUser>();
    }
}
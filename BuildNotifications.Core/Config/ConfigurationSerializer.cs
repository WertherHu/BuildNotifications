﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Anotar.NLog;
using BuildNotifications.Core.Plugin;
using BuildNotifications.Core.Utilities;

namespace BuildNotifications.Core.Config
{
    public class ConfigurationSerializer : IConfigurationSerializer
    {
        public ConfigurationSerializer(ISerializer serializer, IPluginRepository pluginRepository)
        {
            _serializer = serializer;
            _pluginRepository = pluginRepository;
        }

        public IConfiguration Load(string fileName)
        {
            Configuration configuration;
            if (File.Exists(fileName))
            {
                try
                {
                    var json = File.ReadAllText(fileName);
                    configuration = _serializer.Deserialize<Configuration>(json);
                }
                catch (Exception e)
                {
                    LogTo.InfoException("Failed to load existing config.", e);
                    configuration = new Configuration();
                }
            }
            else
            {
                LogTo.Info($"File {fileName} does not exist. Using default configuration");
                configuration = new Configuration();
            }

            configuration.PossibleBuildPluginsFunction = () => _pluginRepository.Build.Select(x => x.GetType().FullName);
            configuration.PossibleSourceControlPluginsFunction = () => _pluginRepository.SourceControl.Select(x => x.GetType().FullName);
            configuration.PluginRepository = _pluginRepository;

            return configuration;
        }

        public IEnumerable<ConnectionData> LoadPredefinedConnections(string fileName)
        {
            if (!File.Exists(fileName))
                return Enumerable.Empty<ConnectionData>();

            var json = File.ReadAllText(fileName);
            var list = _serializer.Deserialize<List<ConnectionData>>(json);

            return list;
        }

        public void Save(IConfiguration configuration, string fileName)
        {
            var json = _serializer.Serialize(configuration);
            var directory = Path.GetDirectoryName(fileName);
            if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
                LogTo.Info($"Creating directory for config \"{directory}\" as it does not exist.");
            }

            File.WriteAllText(fileName, json);
        }

        private readonly ISerializer _serializer;
        private readonly IPluginRepository _pluginRepository;
    }
}
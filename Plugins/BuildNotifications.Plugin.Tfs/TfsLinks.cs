﻿using BuildNotifications.PluginInterfaces.Builds;
using Microsoft.TeamFoundation.Build.WebApi;
using Microsoft.VisualStudio.Services.WebApi;

namespace BuildNotifications.Plugin.Tfs
{
    internal class TfsLinks : IBuildLinks
    {
        private readonly Build _fromBuild;

        public TfsLinks(Build fromBuild)
        {
            _fromBuild = fromBuild;
        }

        public string? BuildWeb => TryGetLink("web");

        public string? BranchWeb => null;

        public string? DefinitionWeb => null;

        private string? TryGetLink(string key)
        {
            if (_fromBuild.Links.Links.TryGetValue(key, out var link))
                return ((ReferenceLink) link).Href;
            return null;
        }
    }
}
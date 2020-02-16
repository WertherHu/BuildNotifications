﻿using System.Text.RegularExpressions;

namespace BuildNotifications.Core.Utilities
{
    internal class BranchNameExtractor : IBranchNameExtractor
    {
        public string ExtractDisplayName(string fullBranchName)
        {
            if (fullBranchName.StartsWith(GitRefHeadPrefix))
                return fullBranchName.Substring(GitRefHeadPrefix.Length);

            var match = PullRequestPattern.Match(fullBranchName);
            if (match.Success)
                return $"PR {match.Groups[1].Value}";

            return fullBranchName;
        }

        public bool IsPullRequest(string? fullBranchName)
        {
            var match = PullRequestPattern.Match(fullBranchName);
            return match.Success;
        }

        private const string GitRefHeadPrefix = "refs/heads/";
        private static readonly Regex PullRequestPattern = new Regex("refs\\/pull\\/([\\d]+)\\/merge", RegexOptions.Compiled);
    }
}
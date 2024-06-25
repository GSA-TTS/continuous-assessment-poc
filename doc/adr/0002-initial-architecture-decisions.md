# 2. Initial architecture decisions

Date: 2024-06-25

## Status

Accepted

## Context

We need to choose the initial language and framework for the continuous_monitoring application.

## Decision

We will use:

* Language: Ruby
* Framework: Rails with unused frameworks disabled.
* Unit tests: RSpec
* Javascript bundler: webpack

## Consequences

Ruby on Rails is a common development environment for the developers on this team, leading to faster development timelines.

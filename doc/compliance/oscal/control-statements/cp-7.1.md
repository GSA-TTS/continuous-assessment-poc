---
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: app-redundant-containers
      description: Application owners must ensure multiple instances of application
        are running
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: cp-07.01
---

# cp-7.1 - \[\] Separation from Primary Site

## Control Statement

Identify an alternate processing site that is sufficiently separated from the primary processing site to reduce susceptibility to the same threats.

## Control Assessment Objective

an alternate processing site that is sufficiently separated from the primary processing site to reduce susceptibility to the same threats is identified.

## Control guidance

Threats that affect alternate processing sites are defined in organizational assessments of risk and include natural disasters, structural failures, hostile attacks, and errors of omission or commission. Organizations determine what is considered a sufficient degree of separation between primary and alternate processing sites based on the types of threats that are of concern. For threats such as hostile attacks, the degree of separation between sites is less relevant.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: cp-7.1 -->

#### Implementation Status: planned

### Cloud.gov

cloud.gov distributes customer workloads across availability zones. Application owners are responsible for ensuring multiple instances of their application are running in order to take advantage of multiple availability zones.

#### Rules:

  - app-redundant-containers

#### Implementation Status: partial

______________________________________________________________________

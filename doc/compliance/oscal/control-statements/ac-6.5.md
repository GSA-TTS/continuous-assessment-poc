---
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: system-roles-needed
      description: The system must manage user roles
x-trestle-set-params:
  # You may set values for parameters in the assembled SSP by adding
  #
  # ssp-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values in the resolved profile catalog, and the ssp-values represent new values
  # to be placed in SetParameters of the SSP.
  #
  ac-06.05_odp:
    guidelines:
      - prose: personnel or roles to which privileged accounts on the system are to
          be restricted is/are defined;
    values:
      - GSA S/SO or Contractor recommended employees and contractors as approved by
        the GSA CISO and AO
    alt-identifier: ac-6.5_prm_1
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ac-06.05
---

# ac-6.5 - \[\] Privileged Accounts

## Control Statement

Restrict privileged accounts on the system to [GSA S/SO or Contractor recommended employees and contractors as approved by the GSA CISO and AO].

## Control Assessment Objective

privileged accounts on the system are restricted to [GSA S/SO or Contractor recommended employees and contractors as approved by the GSA CISO and AO].

## Control guidance

Privileged accounts, including super user accounts, are typically described as system administrator for various types of commercial off-the-shelf operating systems. Restricting privileged accounts to specific personnel or roles prevents day-to-day users from accessing privileged information or privileged functions. Organizations may differentiate in the application of restricting privileged accounts between allowed privileges for local accounts and for domain accounts provided that they retain the ability to control system configurations for key parameters and as otherwise necessary to sufficiently mitigate risk.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

Users can be assigned the admin role to allow access to privileged functions.

Privileged accounts within the application are limited to Ryan only.

#### Implementation Status: implemented

### Cloud.gov

The roles are defined by cloud.gov but the application owner must make the proper assignments to personnel to ensure least privilege is enforced.

Ryan monitors the cloud.gov roles to ensure that only Ryan can access the cloud.gov infrastructure.

#### Rules:

  - system-roles-needed

#### Implementation Status: implemented

______________________________________________________________________

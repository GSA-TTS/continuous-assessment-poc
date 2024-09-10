---
x-trestle-add-props: []
  # Add or modify control properties here
  # Properties may be at the control or part level
  # Add control level properties like this:
  #   - name: ac1_new_prop
  #     value: new property value
  #
  # Add properties to a statement part like this, where "b." is the label of the target statement part
  #   - name: ac1_new_prop
  #     value: new property value
  #     smt-part: b.
  #
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: app-account-management-needed
      description: Application accounts are the responsiblity of the application owner
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ac-03
---

# ac-3 - \[Access Control\] Access Enforcement

## Control Statement

Enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies.

## Control Assessment Objective

approved authorizations for logical access to information and system resources are enforced in accordance with applicable access control policies.

## Control guidance

Access control policies control access between active entities or subjects (i.e., users or processes acting on behalf of users) and passive entities or objects (i.e., devices, files, records, domains) in organizational systems. In addition to enforcing authorized access at the system level and recognizing that systems can host many applications and services in support of mission and business functions, access enforcement mechanisms can also be employed at the application and service level to provide increased information security and privacy. In contrast to logical access controls that are implemented within the system, physical access controls are addressed by the controls in the Physical and Environmental Protection ( [PE](#pe) ) family.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

The Pundit library is used to enforce authorization checks for all data access within the Rails application. This check utilizes the attributes of the data and the currently logged in user to determine if access should be granted or not.

#### Implementation Status: implemented

### Cloud.gov

For UAA accounts used to manage the applications cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner. The delineation of higher privileged accounts in the application and their monitoring is the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

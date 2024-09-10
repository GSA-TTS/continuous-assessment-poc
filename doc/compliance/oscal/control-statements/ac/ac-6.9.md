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
    - name: fully-inherited
      description: Customer fully inherits this control with no responsibility
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ac-06.09
---

# ac-6.9 - \[Access Control\] Log Use of Privileged Functions

## Control Statement

Log the execution of privileged functions.

## Control Assessment Objective

the execution of privileged functions is logged.

## Control guidance

The misuse of privileged functions, either intentionally or unintentionally by authorized users or by unauthorized external entities that have compromised system accounts, is a serious and ongoing concern and can have significant adverse impacts on organizations. Logging and analyzing the use of privileged functions is one way to detect such misuse and, in doing so, help mitigate the risk from insider threats and the advanced persistent threat.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

Privileged functions within the app are logged including timestamp, relevant record id, and current_user id.

#### Implementation Status: implemented

### Cloud.gov

cloud.gov automatically logs privileged actions taken within cloud.gov.

#### Rules:

  - fully-inherited

#### Implementation Status: implemented

______________________________________________________________________

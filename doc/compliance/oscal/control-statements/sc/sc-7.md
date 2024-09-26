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
    - name: egress-control-in-place
      description: Customer must ensure egress control is in place
  DevTools Cloud.gov:
    - name: ssh-access-disabled
      description: Production spaces should disable ssh access
    - name: ssh-access-disabled
      description: Production spaces should disable ssh access
x-trestle-rules-params:
  DevTools Cloud.gov:
    - name: gov.cloud.space-names
      description: The cloud.gov spaces in which ssh access should be disabled
      options: rahearn
      rule-id: ssh-access-disabled
    - name: gov.cloud.org-name
      description: The cloud.gov org in which ssh access should be disabled
      options: gsa-tts-devtools-prototyping
      rule-id: ssh-access-disabled
x-trestle-comp-def-rules-param-vals:
  # You may set new values for rule parameters by adding
  #
  # ssp-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values as set by the components, and the ssp-values are the new values
  # to be placed in SetParameters of the SSP.
  #
  DevTools Cloud.gov:
    - name: gov.cloud.org-name
      values:
        - gsa-tts-devtools-prototyping
    - name: gov.cloud.space-names
      values:
        - rahearn
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
  sc-07_odp:
    values:
      - logically
    alt-identifier: sc-7_prm_1
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: sc-07
---

# sc-7 - \[System and Communications Protection\] Boundary Protection

## Control Statement

- \[a.\] Monitor and control communications at the external managed interfaces to the system and at key internal managed interfaces within the system;

- \[b.\] Implement subnetworks for publicly accessible system components that are [logically] separated from internal organizational networks; and

- \[c.\] Connect to external networks or systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security and privacy architecture.

## Control Assessment Objective

- \[SC-07a.\]

  - \[SC-07a.[01]\] communications at external managed interfaces to the system are monitored;
  - \[SC-07a.[02]\] communications at external managed interfaces to the system are controlled;
  - \[SC-07a.[03]\] communications at key internal managed interfaces within the system are monitored;
  - \[SC-07a.[04]\] communications at key internal managed interfaces within the system are controlled;

- \[SC-07b.\] subnetworks for publicly accessible system components are [logically] separated from internal organizational networks;

- \[SC-07c.\] external networks or systems are only connected to through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security and privacy architecture.

## Control guidance

Managed interfaces include gateways, routers, firewalls, guards, network-based malicious code analysis, virtualization systems, or encrypted tunnels implemented within a security architecture. Subnetworks that are physically or logically separated from internal networks are referred to as demilitarized zones or DMZs. Restricting or prohibiting interfaces within organizational systems includes restricting external web traffic to designated web servers within managed interfaces, prohibiting external traffic that appears to be spoofing internal addresses, and prohibiting internal traffic that appears to be spoofing external addresses. [SP 800-189](#f5edfe51-d1f2-422e-9b27-5d0e90b49c72) provides additional information on source address validation techniques to prevent ingress and egress of traffic with spoofed addresses. Commercial telecommunications services are provided by network components and consolidated management systems shared by customers. These services may also include third party-provided access lines and other service elements. Such services may represent sources of increased risk despite contract security provisions. Boundary protection may be implemented as a common control for all or part of an organizational network such that the boundary to be protected is greater than a system-specific boundary (i.e., an authorization boundary).

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: sc-7 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

### This System

Outbound traffic is disabled by default. Traffic can be allowed:

* To cloud.gov-managed service endpoints, via security groups maintained by the cloud.gov team
* To allow-listed host names via an egress proxy run by This System

#### Implementation Status: implemented

### Cloud.gov

Application owners are responsible for ensuring their application does not exchange traffic with systems outside its own boundary over unsanctioned or unmonitored interfaces.

#### Rules:

  - egress-control-in-place

#### Implementation Status: partial

### DevTools Cloud.gov

SSH access to production spaces has been disabled.

#### Rules:

  - ssh-access-disabled

#### Implementation Status: implemented

______________________________________________________________________

## Implementation for part b.

### This System

Outbound traffic is disabled by default. Traffic can be allowed:

* To cloud.gov-managed service endpoints, via security groups maintained by the cloud.gov team
* To allow-listed host names via an egress proxy run by This System

#### Implementation Status: implemented

### Cloud.gov

Application owners are responsible for ensuring their application does not exchange traffic with systems outside its own boundary over unsanctioned or unmonitored interfaces.

#### Rules:

  - egress-control-in-place

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part c.

### This System

Outbound traffic is disabled by default. Traffic can be allowed:

* To cloud.gov-managed service endpoints, via security groups maintained by the cloud.gov team
* To allow-listed host names via an egress proxy run by This System

#### Implementation Status: implemented

### Cloud.gov

Application owners are responsible for ensuring their application does not exchange traffic with systems outside its own boundary over unsanctioned or unmonitored interfaces.

#### Rules:

  - egress-control-in-place

#### Implementation Status: partial

______________________________________________________________________

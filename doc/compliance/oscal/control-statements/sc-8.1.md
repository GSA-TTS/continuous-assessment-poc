---
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: fully-inherited
      description: Customer fully inherits this control with no responsibility
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
  sc-08.01_odp:
    values:
      - prevent unauthorized disclosure of information and detect changes to information
    alt-identifier: sc-8.1_prm_1
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: sc-08.01
---

# sc-8.1 - \[\] Cryptographic Protection

## Control Statement

Implement cryptographic mechanisms to [prevent unauthorized disclosure of information and detect changes to information] during transmission.

## Control Assessment Objective

cryptographic mechanisms are implemented to [prevent unauthorized disclosure of information and detect changes to information] during transmission.

## Control guidance

Encryption protects information from unauthorized disclosure and modification during transmission. Cryptographic mechanisms that protect the confidentiality and integrity of information during transmission include TLS and IPSec. Cryptographic mechanisms used to protect information integrity include cryptographic hash functions that have applications in digital signatures, checksums, and message authentication codes.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: sc-8.1 -->

#### Implementation Status: planned

### Cloud.gov

Customer applications fully inherit this control from cloud.gov.

#### Rules:

  - fully-inherited

#### Implementation Status: implemented

______________________________________________________________________

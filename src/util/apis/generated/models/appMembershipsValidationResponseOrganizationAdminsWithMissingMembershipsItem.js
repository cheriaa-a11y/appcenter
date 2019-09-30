/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 *
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

'use strict';

/**
 * Class representing a AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem.
 */
class AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem {
  /**
   * Create a AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem.
   * @property {string} [organizationId]
   * @property {string} [userId]
   * @property {string} [role]
   * @property {string} [origin]
   */
  constructor() {
  }

  /**
   * Defines the metadata of AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem
   *
   * @returns {object} metadata of AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem
   *
   */
  mapper() {
    return {
      required: false,
      serializedName: 'AppMembershipsValidationResponse_organization_admins_with_missing_membershipsItem',
      type: {
        name: 'Composite',
        className: 'AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem',
        modelProperties: {
          organizationId: {
            required: false,
            serializedName: 'organization_id',
            type: {
              name: 'String'
            }
          },
          userId: {
            required: false,
            serializedName: 'user_id',
            type: {
              name: 'String'
            }
          },
          role: {
            required: false,
            serializedName: 'role',
            type: {
              name: 'String'
            }
          },
          origin: {
            required: false,
            serializedName: 'origin',
            type: {
              name: 'String'
            }
          }
        }
      }
    };
  }
}

module.exports = AppMembershipsValidationResponseOrganizationAdminsWithMissingMembershipsItem;
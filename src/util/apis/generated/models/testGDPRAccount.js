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
 * Class representing a TestGDPRAccount.
 */
class TestGDPRAccount {
  /**
   * Create a TestGDPRAccount.
   * @property {uuid} [id]
   */
  constructor() {
  }

  /**
   * Defines the metadata of TestGDPRAccount
   *
   * @returns {object} metadata of TestGDPRAccount
   *
   */
  mapper() {
    return {
      required: false,
      serializedName: 'TestGDPRAccount',
      type: {
        name: 'Composite',
        className: 'TestGDPRAccount',
        modelProperties: {
          id: {
            required: false,
            serializedName: 'id',
            type: {
              name: 'String'
            }
          }
        }
      }
    };
  }
}

module.exports = TestGDPRAccount;
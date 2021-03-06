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
 * Class representing a ErrorGroupsSearchResult.
 */
class ErrorGroupsSearchResult {
  /**
   * Create a ErrorGroupsSearchResult.
   * @property {boolean} [hasMoreResults]
   * @property {array} [errorGroups]
   */
  constructor() {
  }

  /**
   * Defines the metadata of ErrorGroupsSearchResult
   *
   * @returns {object} metadata of ErrorGroupsSearchResult
   *
   */
  mapper() {
    return {
      required: false,
      serializedName: 'ErrorGroupsSearchResult',
      type: {
        name: 'Composite',
        className: 'ErrorGroupsSearchResult',
        modelProperties: {
          hasMoreResults: {
            required: false,
            serializedName: 'hasMoreResults',
            type: {
              name: 'Boolean'
            }
          },
          errorGroups: {
            required: false,
            serializedName: 'errorGroups',
            type: {
              name: 'Sequence',
              element: {
                  required: false,
                  serializedName: 'ErrorGroupListItemElementType',
                  type: {
                    name: 'Composite',
                    className: 'ErrorGroupListItem'
                  }
              }
            }
          }
        }
      }
    };
  }
}

module.exports = ErrorGroupsSearchResult;

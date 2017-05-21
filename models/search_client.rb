class SearchClient
  require 'elasticsearch'
  def self.client
    Elasticsearch::Client.new log: true
  end
  def self.create_client(index='main', opts={})
    self.client.indices.create index: 'main', body: {
      settings: {
        analysis: {
          filter: {
            synonyms: {
              type: 'synonym',
              synonyms: [ "quick,fast" ]
            }
          },
          analyzer: {
            title_synonym: {
              type: 'custom',
              tokenizer: 'whitespace',
              filter: ['lowercase', 'stop', 'snowball', 'synonyms']
            }
          }
        }
      },
      mappings: {
        mytype: {
          properties: {
            title: {
              type: 'string',
              analyzer: 'title_synonym'
            }
          }
        }
      }
    }
  end
end 

# # Index three documents
# client.index index: 'myindex', type: 'mytype', id: 1, body: { title: 'Quick Brown Fox'   }
# client.index index: 'myindex', type: 'mytype', id: 2, body: { title: 'Slow Black Dog'    }
# client.index index: 'myindex', type: 'mytype', id: 3, body: { title: 'Fast White Rabbit' }
# client.indices.refresh index: 'myindex'

# client.mlt index: 'myindex', type: 'mytype', id: 1, mlt_fields: 'title', min_doc_freq: 1, min_term_freq: 1
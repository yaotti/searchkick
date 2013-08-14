require "tire"
require "searchkick/version"
require "searchkick/reindex"
require "searchkick/results"
require "searchkick/search"
require "searchkick/similar"
require "searchkick/model"
require "searchkick/tasks"
require "searchkick/logger" if defined?(Rails)

require "lingua/stemmer"

module Searchkick

  def self.group_queries(queries)
    # queries.group_by do |query, count|
    #   Lingua.stemmer(query.to_s.downcase.delete(" "))
    # end.reject{|s, v| s.empty? }.map do |stem, variations|
    #   {
    #     query: variations.max_by{|q, c| c }.first,
    #     count: variations.sum{|q, c| c },
    #     variations: variations.sort_by{|q, c| -c }.map{|q, c| {query: q, count: c} }
    #   }
    # end.sort_by{|r| -r[:count] }

    # payload = {
    #   query: {
    #     match_all: {}
    #   },
    #   facets: {
    #     tag: {
    #       terms: {
    #         field: "name.suggest",
    #         size: 1000
    #       }
    #     }
    #   }
    # }

    # p Tire::Search::Search.new(Item.index_name, payload: payload).json

    # count queries

  end

end

# TODO find better ActiveModel hook
ActiveModel::AttributeMethods::ClassMethods.send(:include, Searchkick::Model)
ActiveRecord::Base.send(:extend, Searchkick::Model) if defined?(ActiveRecord)

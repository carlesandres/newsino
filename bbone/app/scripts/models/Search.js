/*global define*/

define([
    'underscore',
    'backbone',
    'collections/Meanings',
], function (_, Backbone, Meanings) {
    'use strict';

    var Search = Backbone.Model.extend({
        defaults: {
            entry: '',
            id: '',
            status: ''
        },

        initialize: function () {
            this.on('change:id', this.update, this);
        },

        update: function () {
            this.fetch( { 'error': this.onServerError } );
        },

        onServerError: function ( model, response, options ) {
            model.trigger('serverError');
        },

        parse: function (response) {
            response.status = response.status || 'ok';
            response.meanings = response.meanings ? new Meanings(response.meanings) : {};
            return response;
        },

        urlRoot: '/sinonimos'
    });

    return new Search();
});

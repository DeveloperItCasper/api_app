# frozen_string_literal: true
require 'rails_helper'

  shared_examples_for 'importable' do
    let(:model) { described_class.create() }

    describe 'Import' do
      it 'return false unless url present' do
        expect(model.import).to eql(false)
      end

      it 'return error if url is not correct' do
          model.update_attribute(:url, 'test.com')
          model.import
          expect(model.errors[:base]).not_to be_empty
      end

      it 'grab content from source' do
        model.update_attribute(:url, 'http://www.google.com')
        model.import
        expect(model.links).not_to be_empty
      end
    end

  end


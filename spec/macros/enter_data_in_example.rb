module Macros
  def it_should_properly_enter_data_in_example

    let(:text_input) { pincers.css('#name') }
    let(:textarea_input) { pincers.css('#message') }
    let(:select_input) { pincers.css('#category') }
    let(:checkbox_input) { pincers.css('#option') }
    let(:checkbox_input_checked) { pincers.css('#other-option') }

    describe "set" do
      it "should properly set text type inputs" do
        text_input.set('foo')
        expect(text_input[:value]).to eq('foo')
      end

      it "should properly set textarea type inputs" do
        textarea_input.set('bar')
        expect(textarea_input[:value]).to eq('bar')
      end

      it "should properly set select type inputs" do
        expect(select_input[:value]).to eq('private')
        select_input.set('All')
        expect(select_input[:value]).to eq('broadcast')
      end

      it "should properly set select type inputs by value" do
        expect(select_input[:value]).to eq('private')
        select_input.set(by_value: 'default')
        expect(select_input[:value]).to eq('default')
      end

      it "should properly set checkbox type inputs" do
        expect(checkbox_input.set false).to be false
        expect(checkbox_input.set true).to be true
        expect(checkbox_input.checked?).to be true

        expect(checkbox_input_checked.set true).to be false
        expect(checkbox_input_checked.set false).to be true
        expect(checkbox_input_checked.checked?).to be false
      end
    end

    describe "selected" do

      it "should return the selected value after changing it" do
        expect { select_input.set('All') }.to change { select_input.selected.first.value }
      end

    end

    describe "checked" do

      it "should return the checked value after changing it" do
        expect { checkbox_input.set true }.to change { pincers.checked.count }.by(1)
      end

    end

  end
end
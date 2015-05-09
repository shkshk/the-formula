lib = "../input"

jest.dontMock(lib)
React = require("react/addons")
Input = require(lib)
TestUtils = React.addons.TestUtils

describe "Input", ->
  describe "#render", ->
    beforeEach ->
      @input = TestUtils.renderIntoDocument(
        <Input name="foo" title="Fooish" value="bar" />
      )

    it "renders label", ->
      label = TestUtils.findRenderedDOMComponentWithTag(@input, "label").getDOMNode()

      expect(label.textContent).toEqual("Fooish")
      expect(label.getAttribute("for")).toEqual("f-foo")

    it "renders input", ->
      input = TestUtils.findRenderedDOMComponentWithTag(@input, "input").getDOMNode()

      expect(input.value).toEqual("bar")
      expect(input.name).toEqual("foo")
      expect(input.id).toEqual("f-foo")

  describe "events", ->
    describe "on input change", ->
      beforeEach ->
        @onChange = jest.genMockFunction()
        @onChangeMock = @onChange.mock
        @input = TestUtils.renderIntoDocument(
          <Input name="foo" title="Fooish" value="bar" onChange={@onChange} />
        )

      it "runs specified callback", ->
        input = TestUtils.findRenderedDOMComponentWithTag(@input, "input")
        TestUtils.Simulate.change(input)

        expect(@onChangeMock.calls.length).toEqual(1)

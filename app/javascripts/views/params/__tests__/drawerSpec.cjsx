lib = "../drawer.cjsx"

jest.dontMock(lib)
jest.dontMock("classnames")
React = require("react/addons")
Drawer = require(lib)
TestUtils = React.addons.TestUtils

describe "Drawer", ->
  describe "#render", ->
    it "renders active drawer button", ->
      @drawer = TestUtils.renderIntoDocument(<Drawer active="true" />)
      button = TestUtils.findRenderedDOMComponentWithTag(@drawer, "button").getDOMNode()

      expect(button.className).toEqual("pseudo_link pseudo_link--small is-active")

    it "renders inactive drawer button", ->
      @drawer = TestUtils.renderIntoDocument(<Drawer />)
      button = TestUtils.findRenderedDOMComponentWithTag(@drawer, "button").getDOMNode()

      expect(button.className).toEqual("pseudo_link pseudo_link--small")

  describe "events", ->
    describe "on button click", ->
      beforeEach ->
        @onChange = jest.genMockFunction()
        @onChangeMock = @onChange.mock
        @drawer = TestUtils.renderIntoDocument(<Drawer active="true" onChange={@onChange} />)
        @button = TestUtils.findRenderedDOMComponentWithTag(@drawer, "button")

      it "runs specified callback", ->
        TestUtils.Simulate.click(@button)

        expect(@onChangeMock.calls.length).toEqual(1)

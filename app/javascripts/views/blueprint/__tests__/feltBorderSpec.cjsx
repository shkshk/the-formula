lib = "../feltBorder"

jest.dontMock(lib)
React = require("react/addons")
FeltBorder = require(lib)
TestUtils = React.addons.TestUtils

describe "FeltBorder", ->
  describe "#render", ->
    beforeEach ->
      @feltBorder = TestUtils.renderIntoDocument(<FeltBorder top="120" />)

    it "renders felt border with specified top coordinate", ->
      border = TestUtils.findRenderedDOMComponentWithClass(@feltBorder, "blueprint-felt_border").getDOMNode()

      expect(border.style.top).toEqual("120mm")

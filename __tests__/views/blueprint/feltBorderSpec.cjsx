lib = "../../../app/javascripts/views/blueprint/feltBorder.cjsx"

jest.dontMock(lib)
React = require("react/addons")
FeltBorder = require(lib)
TestUtils = React.addons.TestUtils

describe "FeltBorder", ->
  describe "#render", ->
    beforeEach ->
      @feltBorder = TestUtils.renderIntoDocument(<FeltBorder top="120" />)

    it "renders felt border with specified top coordinate", ->
      border = TestUtils.findRenderedDOMComponentWithTag(@feltBorder, "div").getDOMNode()

      expect(border.className).toEqual("blueprint-felt_border")
      expect(border.style.top).toEqual("120mm")

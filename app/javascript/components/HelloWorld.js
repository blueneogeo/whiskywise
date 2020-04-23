import React from "react";
import PropTypes from "prop-types";

// interface Props {
//   greeting: string
// }

export default class HelloWorld extends React.Component {
  render() {
    return this.props.greeting;
    // return pug`
    //   .component Hello world!
  }
}

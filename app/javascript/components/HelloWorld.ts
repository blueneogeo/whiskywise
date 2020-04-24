import React from "react";
import template from './HelloWorld.pug';
import { boundMethod } from 'autobind-decorator'

interface Props {
  username: string
}

export default class HelloWorld extends React.Component<Props> {
  render() {
    console.log('passing username ', this.props.username)
    return template({ username: this.props.username, onClick: this.onClick })
    // return pug`
    //   p hello world!!! {this.props.username}
    // `
  }

  @boundMethod
  onClick(e: any) {
    alert('Clicked!')
  }

}

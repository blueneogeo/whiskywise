import React from "react";
import template from './HelloWorld.pug';
import { boundMethod } from 'autobind-decorator'

interface Props {
  username: string
}

export default class HelloWorld extends React.Component<Props> {

  render() {
    return template({ username: this.props.username, onClick: this.onClick })
  }

  @boundMethod onClick(e: any) {
    alert('works!')
  }

}

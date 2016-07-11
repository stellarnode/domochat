class Message extends React.Component {

  render () {
    return (
      <div>
        <p> { this.props.name } </p>
        <form className="form-inline">
          <textarea className="form-control" rows="3"></textarea>
          <button type="submit" className="btn btn-lg btn-success">Send</button>
        </form>
      </div>
    );
  }
}

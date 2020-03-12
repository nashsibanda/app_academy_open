import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";
import Util from "../../util/util";
import ErrorList from "./error_list";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      sortMethod: "recentlyAdded",
      filterMethod: "allItems",
      todosList: this.props.todos,
      showSortMenu: false,
      showFilterMenu: false,
      showPrefsMenu: false,
      showSearchBar: true,
      prefs: { showSteps: this.props.prefs.showSteps },
      searchString: ""
    };
    this.todosToRender = this.todosToRender.bind(this);
    this.sortSwitch = this.sortSwitch.bind(this);
    this.createSortedList = this.createSortedList.bind(this);
    this.toggleSortMenu = this.toggleSortMenu.bind(this);
    this.filterSwitch = this.filterSwitch.bind(this);
    this.toggleFilterMenu = this.toggleFilterMenu.bind(this);
    this.togglePrefsMenu = this.togglePrefsMenu.bind(this);
    this.toggleSearchBar = this.toggleSearchBar.bind(this);
    this.toggleShowSteps = this.toggleShowSteps.bind(this);
    this.searchedFilterItems = this.searchedFilterItems.bind(this);
    this.updateSearchString = this.updateSearchString.bind(this);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  sortSwitch(toggle) {
    return e => {
      if (this.state.sortMethod === toggle) {
        this.setState({ sortMethod: "recentlyAdded" });
      } else {
        this.setState({ sortMethod: toggle });
      }
    };
  }

  filterSwitch(toggle) {
    return e => {
      if (this.state.filterMethod === toggle) {
        this.setState({ filterMethod: "allItems" });
      } else {
        this.setState({ filterMethod: toggle });
      }
    };
  }

  toggleSortMenu(e) {
    e.preventDefault();
    this.setState({ showSortMenu: !this.state.showSortMenu }, () => {
      if (this.state.showSortMenu) {
        this.setState({ showFilterMenu: false, showPrefsMenu: false });
      }
    });
  }

  toggleFilterMenu(e) {
    e.preventDefault();
    this.setState({ showFilterMenu: !this.state.showFilterMenu }, () => {
      if (this.state.showFilterMenu) {
        this.setState({ showSortMenu: false, showPrefsMenu: false });
      }
    });
  }

  updateSearchString(e) {
    e.preventDefault();
    this.setState({ searchString: e.currentTarget.value.toLowerCase() || "" });
  }

  toggleSearchBar(e) {
    e.preventDefault();
    this.setState({ showSearchBar: !this.state.showSearchBar });
  }

  togglePrefsMenu(e) {
    e.preventDefault();
    this.setState({ showPrefsMenu: !this.state.showPrefsMenu }, () => {
      if (this.state.showPrefsMenu) {
        this.setState({ showSortMenu: false, showFilterMenu: false });
      }
    });
  }

  todosToRender() {
    this.setState({
      todosList: this.createSortedList(this.state.sortMethod)
    });
  }

  filterItems(
    filterMethod = this.state.filterMethod,
    sortMethod = this.state.sortMethod
  ) {
    switch (filterMethod) {
      case "allItems":
        return this.createSortedList(sortMethod, this.props.todos);
      case "dueSoon":
        const dueSoonTodos = this.props.todos.filter(todo =>
          Util.dueSoonCheck(todo.due)
        );
        return this.createSortedList(sortMethod, dueSoonTodos);
      case "notDone":
        const notDoneTodos = this.props.todos.filter(todo => !todo.done);
        return this.createSortedList(sortMethod, notDoneTodos);
      case "done":
        const doneTodos = this.props.todos.filter(todo => todo.done);
        return this.createSortedList(sortMethod, doneTodos);
    }
  }

  createSortedList(
    sortMethod = this.state.sortMethod,
    filteredList = this.props.todos
  ) {
    switch (sortMethod) {
      case "recentlyAdded":
        return filteredList;
      case "oldest":
        return filteredList.concat().reverse();
      case "dueFirst":
        const dueFirstTodos = filteredList.concat().sort((a, b) => {
          let dateA, dateB;
          if (a.due) {
            dateA = Date.parse(a.due);
          } else {
            dateA = Infinity;
          }
          if (b.due) {
            dateB = Date.parse(b.due);
          } else {
            dateB = Infinity;
          }
          return dateA - dateB;
        });
        return dueFirstTodos;
      case "dueLast":
        const dueLastTodos = filteredList.concat().sort((a, b) => {
          let dateA, dateB;
          if (a.due) {
            dateA = Date.parse(a.due);
          } else {
            dateA = 0;
          }
          if (b.due) {
            dateB = Date.parse(b.due);
          } else {
            dateB = 0;
          }
          return dateB - dateA;
        });
        return dueLastTodos;
      default:
        return filteredList;
    }
  }

  searchedFilterItems() {
    const todoList = this.filterItems();
    const searchedList = todoList.filter(todo =>
      todo.title.toLowerCase().includes(this.state.searchString)
    );
    return searchedList;
  }

  toggleShowSteps(e) {
    e.preventDefault();
    this.props.toggleSteps();
    this.setState({
      prefs: { ...this.state.prefs, showSteps: !this.state.prefs.showSteps }
    });
  }

  render() {
    const {
      createTodo,
      updateTodo,
      deleteTodo,
      errors,
      clearErrors,
      fetching
    } = this.props;
    return (
      <div className="todos">
        {errors.length > 0 && <ErrorList errors={errors} />}
        {this.props.fetching && (
          <div className="global-fetching-spinner">
            <h2>
              <i className="fas fa-spinner fetching-wait"></i>
            </h2>
          </div>
        )}
        <TodoForm
          submit={createTodo}
          errors={errors}
          clearErrors={clearErrors}
          fetching={fetching}
        />
        <ul className="todo-list">
          {this.props.todos.length > 0 ? (
            <header className="todo-list-header">
              <h2>Your Todos</h2>
              <div className="pref-menus">
                <div className="sort-toggles">
                  <a
                    className="filter-menu-heading"
                    href="#"
                    onClick={this.togglePrefsMenu}
                  >
                    Preferences
                  </a>
                  {this.state.showPrefsMenu && (
                    <span className="sort-toggles-menu">
                      <span
                        className="due-soon-filter sort-option"
                        onClick={this.toggleShowSteps}
                      >
                        Show Steps by Default:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.prefs.showSteps
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                    </span>
                  )}
                </div>
                <div className="sort-toggles">
                  <a
                    className="filter-menu-heading"
                    href="#"
                    onClick={this.toggleFilterMenu}
                  >
                    Filter Menu
                  </a>
                  {this.state.showFilterMenu && (
                    <span className="sort-toggles-menu">
                      <span
                        className="due-soon-filter sort-option"
                        onClick={this.filterSwitch("dueSoon")}
                      >
                        Due Soon:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.filterMethod === "dueSoon"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="not-done-filter sort-option"
                        onClick={this.filterSwitch("notDone")}
                      >
                        Not Completed:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.filterMethod === "notDone"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="done-filter sort-option"
                        onClick={this.filterSwitch("done")}
                      >
                        Completed:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.filterMethod === "done"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="all-items-filter sort-option"
                        onClick={this.filterSwitch("allItems")}
                      >
                        All Items (Default):{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.filterMethod === "allItems"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                    </span>
                  )}
                </div>
                <div className="sort-toggles">
                  <a
                    href="#"
                    onClick={this.toggleSortMenu}
                    className="filter-menu-heading"
                  >
                    Sort Menu
                  </a>
                  {this.state.showSortMenu && (
                    <span className="sort-toggles-menu">
                      <span
                        className="due-first-sort sort-option"
                        onClick={this.sortSwitch("dueFirst")}
                      >
                        Due First:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.sortMethod === "dueFirst"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="due-last-sort sort-option"
                        onClick={this.sortSwitch("dueLast")}
                      >
                        Due Last:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.sortMethod === "dueLast"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="oldest-sort sort-option"
                        onClick={this.sortSwitch("oldest")}
                      >
                        Oldest:{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.sortMethod === "oldest"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                      <span
                        className="recently-added-sort sort-option"
                        onClick={this.sortSwitch("recentlyAdded")}
                      >
                        Recently Added (Default):{" "}
                        <i
                          className={
                            "fas icon-button " +
                            (this.state.sortMethod === "recentlyAdded"
                              ? "fa-toggle-on"
                              : "fa-toggle-off")
                          }
                        ></i>
                      </span>
                    </span>
                  )}
                </div>
              </div>
              <div className="pref-menus">
                <div className="search-toggles">
                  <a
                    href="#"
                    className="filter-menu-heading"
                    onClick={this.toggleSearchBar}
                  >
                    Search Todos
                  </a>
                  {this.state.showSearchBar && (
                    <span className="search-bar">
                      <input
                        type="text"
                        onChange={this.updateSearchString}
                        placeholder="Enter some text to search your todos..."
                      ></input>
                    </span>
                  )}
                </div>
              </div>
            </header>
          ) : this.props.fetching ? (
            <header className="todo-list-header">
              <h2>
                <i className="fas fa-spinner fetching-wait"></i>
              </h2>
            </header>
          ) : (
            <header className="todo-list-header">
              <h2>You don't have any Todos!</h2>
              <p>Click "Add Todo" above to add your first Todo!</p>
            </header>
          )}

          {this.searchedFilterItems().map(todo => {
            return (
              <TodoListItem
                todo={todo}
                key={todo.id}
                errors={errors}
                clearErrors={clearErrors}
                deleteTodo={deleteTodo}
                updateTodo={updateTodo}
              />
            );
          })}
        </ul>
      </div>
    );
  }
}

export default TodoList;

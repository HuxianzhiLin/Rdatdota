% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_para.R
\name{add_para}
\alias{add_para}
\title{The pre process of the parameters of the request functions}
\usage{
add_para(new_arg, arg_name, args)
}
\arguments{
\item{new_arg}{The new argument to be added.}

\item{arg_name}{The name of the argument in the final url.}

\item{args}{The current argument list}
}
\value{
A list of parameters used in get_response function.
}
\description{
This function is of no particular use to the user, but might be useful for anyone who
would like to dive deeper into the package development. This function is used to add
new parameters to the final GET request.
}
\examples{
\dontrun{
add_para(new_arg = players, arg_name = "players", args = args)
}

}

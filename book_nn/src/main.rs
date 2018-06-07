use std::io;
extern crate rusty_machine as rm;
use rm::learning::nnet::{NeuralNet, BCECriterion};
use rm::learning::toolkit::regularization::Regularization;
use rm::learning::optim::grad_desc::StochasticGD;
use rm::linalg::Matrix;
use rm::learning::SupModel;
use rm::analysis::score::accuracy;
use rm::prelude::BaseMatrix;

fn main() {

let inputs = Matrix::new(5,3, vec![1.,1.,1.,2.,2.,2.,3.,3.,3.,4.,4.,4.,5.,5.,5.,]);
let targets = Matrix::new(5,3, vec![1.,0.,0.,0.,1.,0.,0.,0.,1.,0.,0.,1.,0.,0.,1.]);

// Set the layer sizes - from input to output
let layers = &[3,5,11,7,3];

// Choose the BCE criterion with L2 regularization (`lambda=0.1`).
let criterion = BCECriterion::new(Regularization::L2(0.1));

// We will just use the default stochastic gradient descent.
let mut model = NeuralNet::new(layers, criterion, StochasticGD::default());

// Train the model!
model.train(&inputs, &targets).unwrap();

let test_inputs = Matrix::new(2,3, vec![1.5,1.5,1.5,5.1,5.1,5.1]);

// And predict new output from the test inputs
let outputs = model.predict(&test_inputs).unwrap();
assert_eq!(accuracy(outputs.iter(), targets.iter()), 0.5);
}

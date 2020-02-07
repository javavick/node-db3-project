const db = require("../data/dbConfig.js");

const find = () => {
  return db("schemes");
};

const findById = (id) => {
  return db("schemes")
    .where({ id })
    .first();
};

const findSteps = (id) => {
  return db("schemes")
    .join("steps", "schemes.id", "steps.scheme_id")
    .where("steps.scheme_id", id)
    .select("schemes.id", "scheme_name", "step_number", "instructions")
    .orderBy("step_number");
};

const add = async (scheme) => {
  const [id] = await db("schemes").insert(scheme);

  return findById(id);
};

const update = async (changes, id) => {
  await db("schemes")
    .where({ id })
    .update(changes);

  return findById(id);
};

const remove = (id) => {
  return db("schemes")
    .where({ id })
    .del();
};

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

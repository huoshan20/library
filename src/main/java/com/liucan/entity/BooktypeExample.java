package com.liucan.entity;

import java.util.ArrayList;
import java.util.List;

public class BooktypeExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public BooktypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBooktypeidIsNull() {
            addCriterion("booktypeid is null");
            return (Criteria) this;
        }

        public Criteria andBooktypeidIsNotNull() {
            addCriterion("booktypeid is not null");
            return (Criteria) this;
        }

        public Criteria andBooktypeidEqualTo(Integer value) {
            addCriterion("booktypeid =", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidNotEqualTo(Integer value) {
            addCriterion("booktypeid <>", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidGreaterThan(Integer value) {
            addCriterion("booktypeid >", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("booktypeid >=", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidLessThan(Integer value) {
            addCriterion("booktypeid <", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidLessThanOrEqualTo(Integer value) {
            addCriterion("booktypeid <=", value, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidIn(List<Integer> values) {
            addCriterion("booktypeid in", values, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidNotIn(List<Integer> values) {
            addCriterion("booktypeid not in", values, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidBetween(Integer value1, Integer value2) {
            addCriterion("booktypeid between", value1, value2, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypeidNotBetween(Integer value1, Integer value2) {
            addCriterion("booktypeid not between", value1, value2, "booktypeid");
            return (Criteria) this;
        }

        public Criteria andBooktypenameIsNull() {
            addCriterion("booktypename is null");
            return (Criteria) this;
        }

        public Criteria andBooktypenameIsNotNull() {
            addCriterion("booktypename is not null");
            return (Criteria) this;
        }

        public Criteria andBooktypenameEqualTo(String value) {
            addCriterion("booktypename =", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameNotEqualTo(String value) {
            addCriterion("booktypename <>", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameGreaterThan(String value) {
            addCriterion("booktypename >", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameGreaterThanOrEqualTo(String value) {
            addCriterion("booktypename >=", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameLessThan(String value) {
            addCriterion("booktypename <", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameLessThanOrEqualTo(String value) {
            addCriterion("booktypename <=", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameLike(String value) {
            addCriterion("booktypename like", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameNotLike(String value) {
            addCriterion("booktypename not like", value, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameIn(List<String> values) {
            addCriterion("booktypename in", values, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameNotIn(List<String> values) {
            addCriterion("booktypename not in", values, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameBetween(String value1, String value2) {
            addCriterion("booktypename between", value1, value2, "booktypename");
            return (Criteria) this;
        }

        public Criteria andBooktypenameNotBetween(String value1, String value2) {
            addCriterion("booktypename not between", value1, value2, "booktypename");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table booktype
     *
     * @mbg.generated do_not_delete_during_merge Sun Dec 29 16:04:15 CST 2019
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table booktype
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
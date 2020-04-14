### 사원의 부서별, 업무별 급여의 합, 그리고 급여 총합

    select deptno, job, sum(sal)
    from emp
    group by deptno, job with rollup
    order by deptno;

### 부서별 급여합, 그리고 그 총액

    select deptno, sum(sal)
    from emp
    group by deptno with rollup;

### 그룹핑의 대상이 되었는지 알아보기

    select deptno, job, count(*), grouping(deptno), grouping(job)
    from emp
    group by deptno, job with rollup;

-- grouping()을 사용한다.
-- 1은 대상이 안된거, 0은 대상이 된 것

    select case when grouping(deptno) = 0 AND grouping(job) = 1 then '소계'
                when grouping(deptno) = 1 AND grouping(job) = 1 then '합계'
                else deptno
            end as title,
            job, count(*)
    from emp
    group by deptno, job with rollup;
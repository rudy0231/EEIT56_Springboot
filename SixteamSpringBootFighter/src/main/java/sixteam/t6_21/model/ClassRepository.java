package sixteam.t6_21.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ClassRepository extends JpaRepository<ClassBean, Integer>{
//	@Modifying
//	@Query("UPDATE ClassBean c SET c.classApplicant =:classApplicant WHERE c.classId = :classId")
//	public int updateclassApplicant(@Param("classApplicant")int classApplicant,@Param("classId")int classId);

}

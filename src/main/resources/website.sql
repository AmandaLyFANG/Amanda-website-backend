--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2024-06-27 21:09:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 35323)
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    article_id integer NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_original boolean DEFAULT true NOT NULL,
    is_delete boolean DEFAULT false,
    keyword character varying,
    is_project boolean DEFAULT false NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 35322)
-- Name: article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_article_id_seq OWNER TO postgres;

--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 209
-- Name: article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_article_id_seq OWNED BY public.article.article_id;


--
-- TOC entry 212 (class 1259 OID 35336)
-- Name: article_tag_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article_tag_mapping (
    article_tag_mapping_id integer NOT NULL,
    tag_id integer NOT NULL,
    article_id integer NOT NULL,
    is_delete boolean DEFAULT false
);


ALTER TABLE public.article_tag_mapping OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 35335)
-- Name: article_tag_mapping_article_tag_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_tag_mapping_article_tag_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_tag_mapping_article_tag_mapping_id_seq OWNER TO postgres;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 211
-- Name: article_tag_mapping_article_tag_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.article_tag_mapping_article_tag_mapping_id_seq OWNED BY public.article_tag_mapping.article_tag_mapping_id;


--
-- TOC entry 214 (class 1259 OID 35344)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    tag_name character varying(50) NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_delete boolean DEFAULT false,
    is_project boolean DEFAULT false
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 35343)
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_tag_id_seq OWNER TO postgres;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 213
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- TOC entry 3174 (class 2604 OID 35326)
-- Name: article article_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article ALTER COLUMN article_id SET DEFAULT nextval('public.article_article_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 35339)
-- Name: article_tag_mapping article_tag_mapping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_tag_mapping ALTER COLUMN article_tag_mapping_id SET DEFAULT nextval('public.article_tag_mapping_article_tag_mapping_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 35347)
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- TOC entry 3333 (class 0 OID 35323)
-- Dependencies: 210
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (article_id, title, content, create_time, last_update_time, is_original, is_delete, keyword, is_project) FROM stdin;
1	First Article	First Article	2024-01-29 16:44:59.987096	2024-01-29 16:44:59.987096	t	f	First Article	f
2	Second Article	Second Article	2024-01-29 16:44:59.987096	2024-01-29 16:44:59.987096	t	f	Second Article	f
3	Third Article	Third Article	2024-01-29 16:44:59.987096	2024-01-29 16:44:59.987096	t	f	Third Article	f
11	Natural Language Processing Assignment: Logical Deduction in LLMs	University Name, Department of Computer Science\nSeptember 2023\n\nOverview: Undertook a comprehensive analysis to investigate the logical deduction capabilities of advanced Language Learning Models (LLMs) such as T5 and GPT-3. The project centered on evaluating these models' performance on complex reasoning tasks using the LogiQA and Knights and Knaves puzzles datasets.\n\nTechnologies & Skills:\n\nTechnologies/Tools: Python, TensorFlow, PyTorch, T5, GPT-3\nSkills: Data Analysis, Logical Deduction, Model Evaluation, Prompt Engineering\nAchievements:\n\nSuccessfully demonstrated the application of prompt engineering techniques to enhance the logical reasoning abilities of LLMs, achieving significant improvements in accuracy and F1 score metrics.\nDeveloped a nuanced understanding of the strengths and limitations of current LLMs in NLP, providing insights into areas for future enhancements.\nImpact: This project showcased the potential for advanced prompting strategies to augment LLMs' reasoning skills, contributing to the broader NLP community's efforts towards models that more closely mimic human-like reasoning and interpretation. The findings from this analysis are expected to inform future research directions and practical applications in AI-driven reasoning systems.\n	2024-03-17 16:22:19.732783	2024-03-17 16:22:19.732783	t	f	NLP	t
4	Forth Article	Forth Article	2024-02-03 10:50:04.173	2024-02-03 10:50:04.173	t	f	Forth Article	f
5	Fifth Article	Fifth Article	2024-03-04 04:41:28.493211	2024-03-04 04:41:28.493211	t	f	Fifth Article	f
6	Sixth Article	Sixth Article	2024-03-04 04:41:28.493211	2024-03-04 04:41:28.493211	t	f	Sixth Article	f
7	Seventh Article	Seventh Article	2024-03-04 04:41:28.493211	2024-03-04 04:41:28.493211	t	f	Seventh Article	f
8	Real-Time Data Analysis and Visualization Pipeline	University of Sydney, Department of Computer Science\nDate: July 2023 - November 2023\n\nOverview: Designed and implemented a real-time data processing pipeline for monitoring fuel prices across New South Wales. This comprehensive project spanned data gathering, cleansing, ingestion, and visualization, utilizing a variety of technologies including Python, PostgreSQL, MQTT, Apache Kafka, and Streamlit. The system provided dynamic monitoring of fuel prices, enabling cost-saving decisions for fleet management at the University of Sydney.\n\nTechnologies & Skills:\n\nTechnologies/Tools: Python, PostgreSQL, MQTT, Apache Kafka, Streamlit, Folium for geospatial visualization, Plotly, and Altair for data visualization.\nSkills: Data Engineering, API Integration, Data Cleansing and Processing, Database Design and Management, Real-time Data Visualization, Geospatial Analysis.\nAchievements:\n\nData Collection and Processing: Developed Python scripts for automated data collection from the NSW Fuel Prices API, followed by data cleansing and preparation for database ingestion. This included handling real-time data streams using MQTT and Apache Kafka for efficient data flow.\nDatabase Design: Created a robust database schema to store and manage the cleansed data efficiently, optimizing query performance with carefully designed indexes and relational integrity.\nInteractive Dashboard Development: Built an interactive web-based dashboard using Streamlit, integrated with Folium for mapping and Plotly/Altair for trend analysis. This dashboard provided insights into fuel price trends, geographical price distribution, and identified the cheapest fuel options in real-time.\nComprehensive Data Pipeline: Seamlessly integrated various components into a cohesive data pipeline, demonstrating expertise in building complex data engineering solutions.\nImpact: The project enabled the University of Sydney’s fleet manager to dynamically monitor and analyze fuel prices, identify cost-saving opportunities, and make informed decisions on fuel purchases. The real-time dashboard facilitated strategic planning and operational efficiency, showcasing the practical application of data engineering skills in addressing real-world challenges.	2024-03-17 14:59:40.478595	2024-03-17 14:59:40.478595	t	f	Data	t
9	Data Annotation and Model Evaluation in Natural Language Processing	University Name, Department of Computer Science\nDue: May 15th, 2023\n\nOverview: Engaged in a comprehensive project centered around the critical task of data annotation within NLP, a cornerstone for training effective AI models. The assignment involved stages of initial annotation, adjudication, and refinement of ~2500 tokens of text, followed by evaluating the consistency of annotations and the accuracy of leading NER models (Flair, SpaCy, Stanza) against the adjudicated data.\n\nTechnologies & Skills:\n\nTechnologies/Tools: Python, SLATE (for annotation), Flair, SpaCy, Stanza\nSkills: Data Annotation, Adjudication, NER Model Evaluation, F-Score Calculation, Annotation Guidelines Development\nAchievements:\n\nDeveloped and refined a detailed annotation guide, contributing to the high-quality dataset creation for NLP model training and evaluation.\nSuccessfully adjudicated annotations within a team, resolving discrepancies and standardizing the annotation process for consistency.\nImplemented F-Score metric to evaluate annotation consistency, ensuring high reliability in the data preparation phase.\nConducted a comparative analysis of the accuracy of three widely-used NER models on the annotated dataset, gaining insights into their performance and applicability.\nImpact: This assignment underscored the importance of meticulous data annotation and the critical role of human judgment in the AI model training process. By evaluating the model accuracy on the annotated data, provided practical experience with real-world applications of NER systems and contributed to a deeper understanding of the challenges in achieving high model performance.\n	2024-03-17 15:00:22.420909	2024-03-17 15:00:22.420909	t	f	NLP	t
10	Evaluation of the Performance of Prompt Engineering and Deductive Ability of LLMs Across Diverse Data Sets	September 2023 - April 2024\nUniversity of Sydney, Department of Computer Science\n\nOverview: Led a groundbreaking study to assess the logical deduction capabilities of advanced Language Learning Models (T5 and GPT-3) in NLP, focusing on complex reasoning tasks using the LogiQA and Knights and Knaves puzzles datasets. The project aimed at exploring the effectiveness of prompt engineering in improving LLMs' performance on tasks requiring intricate logical deductions.\nTechnologies & Skills:\nLanguages & Tools: Utilized Python for data analysis and model testing, employing NLP libraries such as TensorFlow and PyTorch for model development and evaluation.\nModels: Extensively worked with state-of-the-art models T5 and GPT-3, applying and testing various prompt engineering techniques to enhance logical reasoning capabilities.\nSkills Developed: Advanced proficiency in logical deduction, prompt engineering, model evaluation (focusing on accuracy and F1 score metrics), and a deep understanding of the intricacies in NLP challenges.\nAchievements & Results:\nSuccessfully demonstrated the viability of 'chain-of-thought' prompting techniques, achieving significant performance improvements in both T5 and GPT-3 models across challenging logical deduction tasks.\nThe findings were critical in identifying the current limitations of LLMs in handling complex reasoning scenarios, providing a foundation for future research to enhance NLP model capabilities.\nDeveloped a comprehensive methodology for prompt engineering, contributing to a deeper understanding of how to effectively leverage LLMs in complex reasoning and decision-making processes.\nImpact:\nThis study contributes valuable insights into enhancing the deductive reasoning skills of LLMs, paving the way for more sophisticated NLP applications. The methodologies and findings have the potential to significantly impact the development of AI systems capable of more human-like reasoning and problem-solving, with broad applications in automated reasoning, knowledge extraction, and intelligent decision-making systems.\n\n	2024-03-17 16:21:32.924838	2024-03-17 16:21:32.924838	t	f	NLP	t
12	某科技智慧运维云平台	项目描述 ：将采集到的设备数据上传至云平台，进行统一汇总、分析、处理，对配电房用电健康进行监控\n分析，生成对应报告。整个项目分为：供应商管理、设备模型、设备、告警模型、告警、 数据\n管理、统计报表、权限管理、数据处理引擎、告警引擎等二十多个微服务；\n技术点：SpringCloud、Oauth2、Rocketmq、MySql、Redis、Mqtt 等\n设计技术：\n1. 采用 Redis 作为服务器的缓存，将设备的实时数据和用户 token、菜单等信息存放至 redis；\n2. 通过 RocketMQ 实现系统解耦，将初步处理过的设备数据通过MQ分发到对应模块。\n3. 对数据量较大的表使用 Sharding-JDBC 数据库中间件实现分表，降低表负载。\n4. 通过 oauth2 实现项目的安全认证。\n其他：\n1. 模块设计开发，参与一期模块设备管理、告警管理；二期模块设备模型、告警模型等模块\n的设计和开发工作；\n2. 定期分析慢 sql，对效率低下的 sql 语句进行调优处理；\n3. 项目维护，相关文档编写等	2024-03-17 16:23:37.572013	2024-03-17 16:23:37.572013	t	f	\N	t
13	某物联网智慧运维云平台	项目描述：建设真空包装机的及时远程监控与设备运维平台，采集设备数据并上传到平台。数据平台进行\n监控、预警，数据收集。通过云端大数据分析,实现设备运行分析、设备健康状态分析（换油\n时间提醒），设备优化分析等。采用分布式的项目开发模式。\n技术点：SpringCloud、Oauth2、Rocketmq、MySql、Redis、Mqtt 等\n设计技术：\n1. 通过整合 mybatis-plus 多租户插件实现多租户功能。\n2. 在 RBAC 租户管理的基础上进行扩展，实现租户体系树结构，新增切面查询下级租户信息，增\n加租户间层级数据权限，使得上层租户能够有且只能查看终端租户的相关数据。\n其他：\n1. 参与了一期产品的消息通知、故障处理、数据管理等模块的设计和开发工作；\n2. 搭建项目发布环境，jenkins+docker 实现自动编译、打包、构建镜像、容器部署；\n3. 搭建 RocketMq、Nacos 集群；\n4. 修改安全审计模块，实现手机验证码登录平台功能；实现密码审计、权限审计等；\n5. 项目维护，相关文档编写等；\n\n	2024-03-17 16:23:37.572013	2024-03-17 16:23:37.572013	t	f	\N	t
\.


--
-- TOC entry 3335 (class 0 OID 35336)
-- Dependencies: 212
-- Data for Name: article_tag_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article_tag_mapping (article_tag_mapping_id, tag_id, article_id, is_delete) FROM stdin;
1	1	1	f
2	2	2	f
3	2	3	f
4	3	4	f
5	3	5	f
6	3	6	f
7	3	7	f
8	8	8	f
9	7	9	f
10	7	10	f
11	7	11	f
12	6	12	f
13	6	13	f
\.


--
-- TOC entry 3337 (class 0 OID 35344)
-- Dependencies: 214
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (tag_id, tag_name, create_time, last_update_time, is_delete, is_project) FROM stdin;
1	Website Updating Log	2024-01-29 16:46:20.225546	2024-01-29 16:46:20.225546	f	f
2	Diary	2024-01-29 16:46:20.225546	2024-01-29 16:46:20.225546	f	f
3	Interests	2024-01-29 16:46:20.225546	2024-01-29 16:46:20.225546	f	f
5	the fifth	2024-02-03 12:11:44.948	2024-02-03 12:11:44.948	t	f
6	Java	2024-03-17 16:18:56.342665	2024-03-17 16:18:56.342665	f	t
7	NLP	2024-03-17 16:18:56.342665	2024-03-17 16:18:56.342665	f	t
8	Data	2024-03-17 16:18:56.342665	2024-03-17 16:18:56.342665	f	t
\.


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 209
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_article_id_seq', 13, true);


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 211
-- Name: article_tag_mapping_article_tag_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_tag_mapping_article_tag_mapping_id_seq', 13, true);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 213
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 8, true);


--
-- TOC entry 3188 (class 2606 OID 35334)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (article_id);


--
-- TOC entry 3190 (class 2606 OID 35342)
-- Name: article_tag_mapping article_tag_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article_tag_mapping
    ADD CONSTRAINT article_tag_mapping_pkey PRIMARY KEY (article_tag_mapping_id);


--
-- TOC entry 3192 (class 2606 OID 35352)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


-- Completed on 2024-06-27 21:09:12

--
-- PostgreSQL database dump complete
--


# HabitTracker

Пайдалы әдістерді қалыптастыру және қадағалау үшін мобильді қосымшаны әзірлеу.

## Пайдаланушылар
Пайдаланушы — әдеттерді басқарады, орындалуын белгілейді, статистиканы қарайды және еске салуды баптайды.

## Сценарий
Әдеттің орындалуын белгілеу: белгі қабылданады, әдет тексеріледі, жазба сақталады, нәтиже қайтарылады.

## Құжаттама
- [dfd-context.drawio](docs/analysis/dfd-context.drawio)
- [dfd-context.png](docs/analysis/dfd-context.png)
- [dfd-level0.drawio](docs/analysis/dfd-level0.drawio)
- [dfd-level0.png](docs/analysis/dfd-level0.png)
- [dfd-level1.drawio](docs/analysis/dfd-level1.drawio)
- [dfd-level1.png](docs/analysis/dfd-level1.png)
- [erd.drawio](docs/database/erd.drawio)
- [erd.png](docs/database/erd.png)
- [schema.sql](docs/database/schema.sql)
- [SQL нәтижесі](docs/database/query-results.png)


## Интерфейс (14 апта)

### Талаптар
13-аптадағы README функциялары негізінде нөмірленді:
- Т1 — пайдаланушы профилін таңдау және қарау (демо, пароль SQL-де жоқ).
- Т2 — әдеттерді қарау.
- Т3 — орындалуын белгілеу және тексеру.
- Т4 — статистиканы қарау.
- Т5 — еске салу параметрін қарау.

[Навигация PNG](docs/ui/navigation.png) · [Өңделетін draw.io](docs/ui/navigation.drawio)

### Экрандар және сәйкестік
| Экран | Талап | SQL кестесі және бағандары |
|---|---|---|
| [01 Кіру](docs/ui/screens/01-login.png) | Т1 | users.id, name, email |
| [02 Басты бет](docs/ui/screens/02-home.png) | Т2, Т3, Т5 | habits.id, title, user_id; habit_logs.completed; goals.target_days; reminders.remind_at |
| [03 Әдеттер](docs/ui/screens/03-habits.png) | Т2 | habits.title, user_id; categories.name; habit_categories.habit_id, category_id; habit_logs.log_date, completed |
| [04 Белгілеу](docs/ui/screens/04-log.png) | Т3 | habit_logs.id, habit_id, log_date, completed; habits.id, title |
| [05 Статистика](docs/ui/screens/05-stats.png) | Т4 | habits.title; habit_logs.habit_id, completed (COUNT, SUM) |
| [06 Профиль](docs/ui/screens/06-profile.png) | Т1, Т5 | users.id, name, email; reminders.habit_id, remind_at |
| [07 Қате](docs/ui/screens/07-error.png) | Т3 | habit_logs.habit_id, log_date, completed; UNIQUE(habit_id, log_date) |

Формада ID 5 жүйе ұсынатын жаңа мән ретінде көрсетілген; нақты іске асыруда бірегей ID тағайындау қажет. Күн 24.11.2026 — жаңа жазба мысалы, INSERT дерегі емес. Статистика экраны 13-аптадағы GROUP BY нәтижесін барлық демо профиль бойынша көрсетеді. Қате сценарийі DFD 3.2 тексеру және 3.3 сақтау негізінде ұсынылды; 12-апта Sequence/alt түпнұсқасы қолжетімді емес.

### Түстер
| Түс | HEX | Қолданылуы |
|---|---|---|
| Жасыл | #167D59 | completed = TRUE, негізгі әрекет |
| Қызыл | #B33C45 | completed = FALSE, тексеру қатесі |
| Қою жасыл | #172D27 | Мәтін |
| Ашық сұр | #F3F5F1 | Фон |
| Ақ | #FFFFFF | Карточка |

schema.sql-де status бағаны жоқ; күй habit_logs.completed BOOLEAN арқылы беріледі.

### Бағалау
[Курстаспен тестілеу кестесі](docs/ui/evaluation.md) — нақты тесттен кейін толтырылады.

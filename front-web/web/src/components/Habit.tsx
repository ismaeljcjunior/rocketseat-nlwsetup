
interface IHabitsProps {
    completed: number
}

export const Habit = (props: IHabitsProps) => {

    return(
        <div className="bg-zinc-900">{props.completed}</div>
    )
}
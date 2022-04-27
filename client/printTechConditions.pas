unit PrintTechConditions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmPrintTechConditions = class(TForm)
    lblTechConditionStr: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
    edtPatternItems: TComboBox;
    edtTechConditionStr: TMemo;
    procedure edtPatternItemsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintTechConditions: TfrmPrintTechConditions;

implementation

{$R *.dfm}

procedure TfrmPrintTechConditions.edtPatternItemsChange(Sender: TObject);
begin
    if edtPatternItems.ItemIndex = 0 then
       edtTechConditionStr.Text := 'запроектувати та виконати реконструкцію елементів електричних мереж, ' +
                  'які є спільною власністю (внутрішньобудинкові мережі), від точки приєднання до власних ' +
                  'установок (за необхідністю) та повідомити АТ "Херсонобленерго" про місце встановлення ' +
                  'вузла обліку; облаштувати вузол комерційного обліку електроенергії згідно вимог ' +
                  'пп. 1 ст. 74 ЗУ “Про ринок електричної енергії”, ст. 1.5. ПУЕ та розділів V, VI ' +
                  'Кодексу комерційного обліку'
    else if edtPatternItems.ItemIndex = 1 then
       edtTechConditionStr.Text := 'визначити проєктом';

end;

end.

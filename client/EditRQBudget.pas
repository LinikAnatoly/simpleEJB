
unit EditRQBudget;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBudgetController,DateUtils ;

type
  TfrmRQBudgetEdit = class(TDialogForm)

    lblCode : TLabel;
	  edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIORQBudget: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    GroupBox1: TGroupBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQBudgetEdit: TfrmRQBudgetEdit;
  RQBudgetObj: RQBudget;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBudgetController  ;
}
{$R *.dfm}



procedure TfrmRQBudgetEdit.FormShow(Sender: TObject);
 var
 tmpDate : TDateTime;
begin

   DisableControls([edtCode , edtNumberGen]);

  if DialogState = dsView then
  begin
  //   DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtMonthGen
      ,edtYearGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQBudgetObj.code);
      edtNumberGen.Text := RQBudgetObj.numberGen;
      if RQBudgetObj.dateGen <> nil then
     begin
        tmpDate:=EncodeDate(RQBudgetObj.dateGen.Year,RQBudgetObj.dateGen.Month,RQBudgetObj.dateGen.Day);

        edtMonthGen.ItemIndex := MonthOf(tmpDate)-1;
        edtYearGen.ItemIndex:= YearOf(tmpDate)-2009;

      end
      else
      begin
        tmpDate:=SysUtils.Date;
     end;


    edtCommentGen.Text := RQBudgetObj.commentGen;


  end;


   if  (DialogState = dsInsert) then
   begin
       SetComboBoxCurrentMonth(edtMonthGen);
       SetComboBoxCurrentYear(edtYearGen, 3, 1);
       edtNumberGen.text := 'Auto';
   end;


end;



procedure TfrmRQBudgetEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBudget: RQBudgetControllerSoapPort;
tmpDate : TDateTime;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;


     RQBudgetObj.numberGen := edtNumberGen.Text; 

//     if edtdateGen.checked then
//     begin
//       if RQBudgetObj.dateGen = nil then
//          RQBudgetObj.dateGen := TXSDate.Create;
//       RQBudgetObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
//     end
//     else
//       RQBudgetObj.dateGen := nil;

     RQBudgetObj.commentGen := edtCommentGen.Text;



    if DialogState = dsInsert then
    begin
       if RQBudgetObj.dateGen = nil then
          RQBudgetObj.dateGen := TXSDate.Create;
          tmpDate  := EncodeDate( StrToInt(edtYearGen.Text) , edtMonthGen.ItemIndex + 1 ,1);
          RQBudgetObj.dateGen.XSToNative(GetXSDate(tmpDate));

      RQBudgetObj.code:=low(Integer);
      TempRQBudget.add(RQBudgetObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQBudget.save(RQBudgetObj);
    end;
  end;
end;


end.
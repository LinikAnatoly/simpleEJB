
unit EditENResponsibles;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENResponsiblesController ;

type
  TfrmENResponsiblesEdit = class(TDialogForm)


  HTTPRIOENResponsibles: THTTPRIO;
    GroupBox1: TGroupBox;
    lblResponsibleFIO: TLabel;
    lblResponsibleTabNumber: TLabel;
    lblResponsiblePosition: TLabel;
    lblResponsibleDepName: TLabel;
    lblResponsibleDepCode: TLabel;
    spbResponsiblePerson: TSpeedButton;
    lblResponsiblePhone: TLabel;
    edtFIO: TEdit;
    edtTabNumber: TEdit;
    edtPosition: TEdit;
    edtDepName: TEdit;
    edtDepCode: TEdit;
    edtPhone: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbResponsiblePersonClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENResponsiblesEdit: TfrmENResponsiblesEdit;
  ENResponsiblesObj: ENResponsibles;

implementation

uses ShowFINWorker, FINWorkerController;


{uses
    EnergyproController, EnergyproController2, ENResponsiblesController  ;
}
{$R *.dfm}



procedure TfrmENResponsiblesEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtFIO, edtTabNumber, edtPosition, edtDepName, edtDepCode, edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtFIO, edtTabNumber]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // Запрещаем изменять !!!
    DisableControls([spbResponsiblePerson]);

    edtCode.Text := IntToStr(ENResponsiblesObj.code);
    edtFIO.Text := ENResponsiblesObj.FIO;
    if ( ENResponsiblesObj.tabNumber <> '' ) then
       edtTabNumber.Text := ENResponsiblesObj.tabNumber
    else
       edtTabNumber.Text := '';
    edtPosition.Text := ENResponsiblesObj.position;
    edtDepName.Text := ENResponsiblesObj.depName;
    edtDepCode.Text := ENResponsiblesObj.depCode;
    edtPhone.Text := ENResponsiblesObj.phone;
  end;
end;



procedure TfrmENResponsiblesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtFIO]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;


     ENResponsiblesObj.FIO := edtFIO.Text; 

     if ( edtTabNumber.Text <> '' ) then
       ENResponsiblesObj.tabNumber := edtTabNumber.Text
     else
       ENResponsiblesObj.tabNumber := '';

     ENResponsiblesObj.position := edtPosition.Text; 

     ENResponsiblesObj.depName := edtDepName.Text; 

     ENResponsiblesObj.depCode := edtDepCode.Text; 

     ENResponsiblesObj.phone := edtPhone.Text; 

    if DialogState = dsInsert then
    begin
      ENResponsiblesObj.code:=low(Integer);
      TempENResponsibles.add(ENResponsiblesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENResponsibles.save(ENResponsiblesObj);
    end;
  end;
end;


procedure TfrmENResponsiblesEdit.spbResponsiblePersonClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   TempFINWorker: FINWorkerControllerSoapPort;
begin
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // f.departmentCode :=  IntToStr(plan.departmentRef.code);

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     // frmFINWorkerShow.dateGet := TXSDate.Create;
     // frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day) ));

     //frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
          try
            ENResponsiblesObj.FIO := GetReturnValue(sgFINWorker,1);
            ENResponsiblesObj.tabNumber := GetReturnValue(sgFINWorker,2);
            ENResponsiblesObj.position := GetReturnValue(sgFINWorker,3);
            //ENHumenItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4));
            ENResponsiblesObj.depName := GetReturnValue(sgFINWorker,5);
            ENResponsiblesObj.depCode := (GetReturnValue(sgFINWorker,6));

            edtFIO.Text := ENResponsiblesObj.FIO;
            edtTabNumber.Text := ENResponsiblesObj.tabNumber;
            edtPosition.Text := ENResponsiblesObj.position;
            edtDepName.Text := ENResponsiblesObj.depName;
            edtDepCode.Text := ENResponsiblesObj.depCode;
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

end.
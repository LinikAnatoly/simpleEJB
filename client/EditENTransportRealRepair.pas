
unit EditENTransportRealRepair;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRealRepairController ;

type
  TfrmENTransportRealRepairEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTransportRealRepair: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportRealRepairEdit: TfrmENTransportRealRepairEdit;
  ENTransportRealRepairObj: ENTransportRealRepair;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportRealRepairController  ;
}
{$R *.dfm}



procedure TfrmENTransportRealRepairEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKTransportRealRealTransportName
      ,spbTKTransportRealRealTransport
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportRealRepairObj.code);
      SetDateFieldForDateTimePicker(edtDateStart, ENTransportRealRepairObj.dateStart);
      SetDateFieldForDateTimePicker(edtDateFinal, ENTransportRealRepairObj.dateFinal);
      MakeMultiline(edtCommentGen.Lines, ENTransportRealRepairObj.commentGen);
      edtTKTransportRealRealTransportName.Text := ENTransportRealRepairObj.realTransport.name;

  end;

  if DialogState = dsEdit then
  begin
    DisableControls([edtDateStart]);
  end;
end;



procedure TfrmENTransportRealRepairEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRealRepair: ENTransportRealRepairControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([

     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportRealRepair := HTTPRIOENTransportRealRepair as ENTransportRealRepairControllerSoapPort;


     ENTransportRealRepairObj.dateStart := GetTXSDateFromTDateTimePicker(edtdateStart);

     ENTransportRealRepairObj.dateFinal := GetTXSDateFromTDateTimePicker(edtdateFinal);

     ENTransportRealRepairObj.commentGen := edtCommentGen.Text;



    if DialogState = dsInsert then
    begin
      ENTransportRealRepairObj.code:=low(Integer);
      TempENTransportRealRepair.add(ENTransportRealRepairObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportRealRepair.save(ENTransportRealRepairObj);
    end;
  end;
end;


procedure TfrmENTransportRealRepairEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRealRepairObj.realTransport = nil then ENTransportRealRepairObj.realTransport := TKTransportReal.Create();
               ENTransportRealRepairObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



end.
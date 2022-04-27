
unit EditENRecordPointPromFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRecordPointPromController ;

type
  TfrmENRecordPointPromFilterEdit = class(TDialogForm)

    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;

    lblAccountName : TLabel;
    edtAccountName: TMemo;

    lblAccountCode : TLabel;
    edtAccountCode: TEdit;

    lblCounterNumber : TLabel;
    edtCounterNumber: TEdit;

    lblRecordPointName : TLabel;
    edtRecordPointName: TMemo;

    lblRecordPointAddr : TLabel;
    edtRecordPointAddr: TMemo;

    lblRecordPointKindName : TLabel;
    edtRecordPointKindName: TEdit;

    lblRecordPointCode : TLabel;
    edtRecordPointCode: TEdit;


  lblEPRenRenName : TLabel;
  edtEPRenRenName : TEdit;
  spbEPRenRen : TSpeedButton;
  

  HTTPRIOENRecordPointProm: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPRenRenClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENRecordPointPromFilterEdit: TfrmENRecordPointPromFilterEdit;
  ENRecordPointPromFilterObj: ENRecordPointPromFilter;

implementation

uses
  ShowENEPRen
  //,EPRenController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENRecordPointPromController  ;
}
{$R *.dfm}



procedure TfrmENRecordPointPromFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtEPRenRenName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtAccountNumber
      ,edtAccountName
      ,edtAccountCode
      ,edtRecordPointName
      ,edtRecordPointKindName
      ,edtRecordPointCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtAccountNumber.Text := ENRecordPointPromObj.accountNumber; 



    MakeMultiline(edtAccountName.Lines, ENRecordPointPromObj.accountName);



    if ( ENRecordPointPromObj.accountCode <> Low(Integer) ) then
       edtAccountCode.Text := IntToStr(ENRecordPointPromObj.accountCode)
    else
       edtAccountCode.Text := '';



    edtCounterNumber.Text := ENRecordPointPromObj.counterNumber; 



    MakeMultiline(edtRecordPointName.Lines, ENRecordPointPromObj.recordPointName);



    MakeMultiline(edtRecordPointAddr.Lines, ENRecordPointPromObj.recordPointAddr);



    edtRecordPointKindName.Text := ENRecordPointPromObj.recordPointKindName; 



    if ( ENRecordPointPromObj.recordPointCode <> Low(Integer) ) then
       edtRecordPointCode.Text := IntToStr(ENRecordPointPromObj.recordPointCode)
    else
       edtRecordPointCode.Text := '';


  end;

}

end;



procedure TfrmENRecordPointPromFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRecordPointPromFilterObj.accountNumber := edtAccountNumber.Text; 



     ENRecordPointPromFilterObj.accountName := edtAccountName.Text; 



     if ( edtAccountCode.Text <> '' ) then
       ENRecordPointPromFilterObj.accountCode := StrToInt(edtAccountCode.Text)
     else
       ENRecordPointPromFilterObj.accountCode := Low(Integer) ;




     ENRecordPointPromFilterObj.counterNumber := edtCounterNumber.Text; 



     ENRecordPointPromFilterObj.recordPointName := edtRecordPointName.Text; 



     ENRecordPointPromFilterObj.recordPointAddr := edtRecordPointAddr.Text; 



     ENRecordPointPromFilterObj.recordPointKindName := edtRecordPointKindName.Text; 



     if ( edtRecordPointCode.Text <> '' ) then
       ENRecordPointPromFilterObj.recordPointCode := StrToInt(edtRecordPointCode.Text)
     else
       ENRecordPointPromFilterObj.recordPointCode := Low(Integer) ;





  end;
end;

procedure TfrmENRecordPointPromFilterEdit.spbEPRenRenClick(Sender : TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRecordPointPromFilterObj.ren = nil then ENRecordPointPromFilterObj.ren := EPRen.Create();
               ENRecordPointPromFilterObj.ren.code := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;





end.
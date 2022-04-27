
unit EditENMetrologyDeviceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyDeviceController ;

type
  TfrmENMetrologyDeviceFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuildNumber : TLabel;
    edtBuildNumber: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENMetrologyDeviceTypeDeviceTypeName : TLabel;
  edtENMetrologyDeviceTypeDeviceTypeName : TEdit;
  spbENMetrologyDeviceTypeDeviceType : TSpeedButton;
  

  HTTPRIOENMetrologyDevice: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMetrologyDeviceTypeDeviceTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyDeviceFilterEdit: TfrmENMetrologyDeviceFilterEdit;
  ENMetrologyDeviceFilterObj: ENMetrologyDeviceFilter;

implementation

uses
  ShowENMetrologyDeviceType
  ,ENMetrologyDeviceTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyDeviceController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyDeviceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMetrologyDeviceObj.name; 



    edtBuildNumber.Text := ENMetrologyDeviceObj.buildNumber; 



    edtInvNumber.Text := ENMetrologyDeviceObj.invNumber; 



    edtBuhName.Text := ENMetrologyDeviceObj.buhName; 



    edtCommentGen.Text := ENMetrologyDeviceObj.commentGen; 


  end;

}

end;



procedure TfrmENMetrologyDeviceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMetrologyDeviceFilterObj.name := edtName.Text; 



     ENMetrologyDeviceFilterObj.buildNumber := edtBuildNumber.Text; 



     ENMetrologyDeviceFilterObj.invNumber := edtInvNumber.Text; 



     ENMetrologyDeviceFilterObj.buhName := edtBuhName.Text; 



     ENMetrologyDeviceFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENMetrologyDeviceFilterEdit.spbENMetrologyDeviceTypeDeviceTypeClick(Sender : TObject);
var 
   frmENMetrologyDeviceTypeShow: TfrmENMetrologyDeviceTypeShow;
begin
   frmENMetrologyDeviceTypeShow:=TfrmENMetrologyDeviceTypeShow.Create(Application,fmNormal);
   try
      with frmENMetrologyDeviceTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMetrologyDeviceFilterObj.deviceType = nil then ENMetrologyDeviceFilterObj.deviceType := ENMetrologyDeviceType.Create();
               ENMetrologyDeviceFilterObj.deviceType.code := StrToInt(GetReturnValue(sgENMetrologyDeviceType,0));
               edtENMetrologyDeviceTypeDeviceTypeName.Text:=GetReturnValue(sgENMetrologyDeviceType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMetrologyDeviceTypeShow.Free;
   end;
end;





end.

unit EditENRecordPointBytFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRecordPointBytController ;

type
  TfrmENRecordPointBytFilterEdit = class(TDialogForm)

    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;

    lblAddress : TLabel;
    edtAddress: TEdit;

    lblCodeEIC : TLabel;
    edtCodeEIC: TEdit;
    //lblRpCode : TLabel;
    //edtRpCode: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENRecordPointByt: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbEPRenRen: TSpeedButton;
    edtEPRenRenName: TEdit;
    lblEPRenRenName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbEPRenRenClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENRecordPointBytFilterEdit: TfrmENRecordPointBytFilterEdit;
  ENRecordPointBytFilterObj: ENRecordPointBytFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  , ShowENEPRen
;

{uses  
    EnergyproController, EnergyproController2, ENRecordPointBytController  ;
}
{$R *.dfm}



procedure TfrmENRecordPointBytFilterEdit.FormShow(Sender: TObject);

begin
DisableControls([edtEPRenRenName]);

end;



procedure TfrmENRecordPointBytFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRecordPointBytFilterObj.accountNumber := edtAccountNumber.Text;
     ENRecordPointBytFilterObj.name := edtName.Text;
     ENRecordPointBytFilterObj.address := edtAddress.Text;
     ENRecordPointBytFilterObj.codeEIC := edtCodeEIC.Text;
  end;
end;

procedure TfrmENRecordPointBytFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRecordPointBytFilterObj.element = nil then ENRecordPointBytFilterObj.element := ENElement.Create();
               ENRecordPointBytFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





procedure TfrmENRecordPointBytFilterEdit.spbEPRenRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
   depCode : Integer;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               depCode := StrToInt(GetReturnValue(sgEPRen,0));
               if ENRecordPointBytFilterObj = nil then ENRecordPointBytFilterObj := ENRecordPointBytFilter.Create();
               ENRecordPointBytFilterObj.conditionSQL := Format('EXISTS (SELECT FROM enelement AS e1 WHERE e1.renrefcode = %d ' +
               ' AND e1.code = enrecordpointbyt.elementcode)', [depCode]);
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
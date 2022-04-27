
unit EditENSDTUObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSDTUObjectController ;

type
  TfrmENSDTUObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;

  lblENSDTUObjectTypeObjectTypeName : TLabel;
  edtENSDTUObjectTypeObjectTypeName : TEdit;
  spbENSDTUObjectTypeObjectType : TSpeedButton;
  

  HTTPRIOENSDTUObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSDTUObjectTypeObjectTypeClick(Sender : TObject);

  private
    { Private declarations }
  public

  procedure hideObjectType();
    { Public declarations }

end;

var
  frmENSDTUObjectFilterEdit: TfrmENSDTUObjectFilterEdit;
  ENSDTUObjectFilterObj: ENSDTUObjectFilter;

implementation

uses
  ShowENSDTUObjectType
  ,ENSDTUObjectTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSDTUObjectController  ;
}
{$R *.dfm}


procedure TfrmENSDTUObjectFilterEdit.hideObjectType();
begin
  HideControls([lblENSDTUObjectTypeObjectTypeName, edtENSDTUObjectTypeObjectTypeName, spbENSDTUObjectTypeObjectType]);
end;

procedure TfrmENSDTUObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSDTUObjectObj.name; 



    edtBuhName.Text := ENSDTUObjectObj.buhName; 



    edtInvNumber.Text := ENSDTUObjectObj.invNumber; 



    edtCommentGen.Text := ENSDTUObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENSDTUObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     ENSDTUObjectFilterObj.name := edtName.Text;
     ENSDTUObjectFilterObj.buhName := edtBuhName.Text;
     ENSDTUObjectFilterObj.invNumber := edtInvNumber.Text;
     //ENSDTUObjectFilterObj.commentGen := edtCommentGen.Text;
  end;
end;

procedure TfrmENSDTUObjectFilterEdit.spbENSDTUObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENSDTUObjectTypeShow: TfrmENSDTUObjectTypeShow;
begin
   frmENSDTUObjectTypeShow:=TfrmENSDTUObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENSDTUObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSDTUObjectFilterObj.objectType = nil then ENSDTUObjectFilterObj.objectType := ENSDTUObjectType.Create();
               ENSDTUObjectFilterObj.objectType.code := StrToInt(GetReturnValue(sgENSDTUObjectType,0));
               edtENSDTUObjectTypeObjectTypeName.Text:=GetReturnValue(sgENSDTUObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSDTUObjectTypeShow.Free;
   end;
end;


end.

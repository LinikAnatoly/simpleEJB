
unit EditENRZAObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRZAObjectController ;

type
  TfrmENRZAObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENRZAObjectTypeObjectTypeName : TLabel;
  edtENRZAObjectTypeObjectTypeName : TEdit;
  spbENRZAObjectTypeObjectType : TSpeedButton;
  

  HTTPRIOENRZAObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENRZAObjectTypeObjectTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENRZAObjectFilterEdit: TfrmENRZAObjectFilterEdit;
  ENRZAObjectFilterObj: ENRZAObjectFilter;

implementation

uses
  ShowENRZAObjectType
  ,ENRZAObjectTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENRZAObjectController  ;
}
{$R *.dfm}



procedure TfrmENRZAObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENRZAObjectObj.name; 



    edtBuhName.Text := ENRZAObjectObj.buhName; 



    edtInvNumber.Text := ENRZAObjectObj.invNumber; 



    edtCommentGen.Text := ENRZAObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENRZAObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRZAObject: ENRZAObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    ENRZAObjectFilterObj.name := edtName.Text;
    ENRZAObjectFilterObj.buhName := edtBuhName.Text;
    ENRZAObjectFilterObj.invNumber := edtInvNumber.Text;
    //ENRZAObjectFilterObj.commentGen := edtCommentGen.Text;
  end;
end;

procedure TfrmENRZAObjectFilterEdit.spbENRZAObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENRZAObjectTypeShow: TfrmENRZAObjectTypeShow;
begin
   frmENRZAObjectTypeShow:=TfrmENRZAObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENRZAObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRZAObjectFilterObj.objectType = nil then ENRZAObjectFilterObj.objectType := ENRZAObjectType.Create();
               ENRZAObjectFilterObj.objectType.code := StrToInt(GetReturnValue(sgENRZAObjectType,0));
               edtENRZAObjectTypeObjectTypeName.Text:=GetReturnValue(sgENRZAObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENRZAObjectTypeShow.Free;
   end;
end;


end.

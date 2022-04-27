
unit EditENIzolationObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIzolationObjectController ;

type
  TfrmENIzolationObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENIzolationObjectTypeObjectTypeName : TLabel;
  edtENIzolationObjectTypeObjectTypeName : TEdit;
  spbENIzolationObjectTypeObjectType : TSpeedButton;
  

  HTTPRIOENIzolationObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENIzolationObjectTypeObjectTypeClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
    renCondition: String;
  public
    { Public declarations }

end;

var
  frmENIzolationObjectFilterEdit: TfrmENIzolationObjectFilterEdit;
  ENIzolationObjectFilterObj: ENIzolationObjectFilter;

implementation

uses
  ShowENIzolationObjectType
  ,ENIzolationObjectTypeController
  ,ShowENElement
  //,ENElementController
, ShowENEPRen;

{uses  
    EnergyproController, EnergyproController2, ENIzolationObjectController  ;
}
{$R *.dfm}



procedure TfrmENIzolationObjectFilterEdit.FormShow(Sender: TObject);
begin
  renCondition := '';

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENIzolationObjectObj.name; 



    edtBuhName.Text := ENIzolationObjectObj.buhName; 



    edtInvNumber.Text := ENIzolationObjectObj.invNumber; 



    edtCommentGen.Text := ENIzolationObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENIzolationObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
    condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
    ENIzolationObjectFilterObj.name := edtName.Text;
    ENIzolationObjectFilterObj.buhName := edtBuhName.Text;
    ENIzolationObjectFilterObj.invNumber := edtInvNumber.Text;
    ENIzolationObjectFilterObj.commentGen := edtCommentGen.Text;

    condition := '';

    if renCondition <> '' then
      AddCondition(condition, renCondition);

    //if elementInCondition <> '' then
    //  AddCondition(condition, elementInCondition);

    if ENIzolationObjectFilterObj.conditionSQL <> '' then
      ENIzolationObjectFilterObj.conditionSQL := ENIzolationObjectFilterObj.conditionSQL + ' and ' + condition
    else
      ENIzolationObjectFilterObj.conditionSQL := condition;
  end;
end;

procedure TfrmENIzolationObjectFilterEdit.spbENIzolationObjectTypeObjectTypeClick(Sender : TObject);
var 
   frmENIzolationObjectTypeShow: TfrmENIzolationObjectTypeShow;
begin
   frmENIzolationObjectTypeShow:=TfrmENIzolationObjectTypeShow.Create(Application,fmNormal);
   try
      with frmENIzolationObjectTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIzolationObjectFilterObj.objectType = nil then ENIzolationObjectFilterObj.objectType := ENIzolationObjectType.Create();
               ENIzolationObjectFilterObj.objectType.code := StrToInt(GetReturnValue(sgENIzolationObjectType,0));
               edtENIzolationObjectTypeObjectTypeName.Text:=GetReturnValue(sgENIzolationObjectType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENIzolationObjectTypeShow.Free;
   end;
end;


procedure TfrmENIzolationObjectFilterEdit.spbEPRenClick(Sender: TObject);
var frmEPRenShow: TfrmENEPRenShow;
begin
  frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
  try
    with frmEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          edtEPRenName.Text := GetReturnValue(sgEPRen,1);
          renCondition := ' elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmEPRenShow.Free;
  end;
end;

end.
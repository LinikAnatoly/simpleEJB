
unit EditENSubst150DisconnectorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubst150DisconnectorController ;

type
  TfrmENSubst150DisconnectorFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblFactoryNumber : TLabel;
    edtFactoryNumber: TEdit;

    lblCurrentNominal : TLabel;
    edtCurrentNominal: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSubst150Disconnector: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150DisconnectorFilterEdit: TfrmENSubst150DisconnectorFilterEdit;
  ENSubst150DisconnectorFilterObj: ENSubst150DisconnectorFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSubst150DisconnectorController  ;
}
{$R *.dfm}



procedure TfrmENSubst150DisconnectorFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubst150DisconnectorObj.name; 



    edtFactoryNumber.Text := ENSubst150DisconnectorObj.factoryNumber; 



    if ( ENSubst150DisconnectorObj.currentNominal <> nil ) then
       edtCurrentNominal.Text := ENSubst150DisconnectorObj.currentNominal.decimalString
    else
       edtCurrentNominal.Text := ''; 



    MakeMultiline(edtCommentGen.Lines, ENSubst150DisconnectorObj.commentGen);



    edtUserGen.Text := ENSubst150DisconnectorObj.userGen; 



      if ENSubst150DisconnectorObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSubst150DisconnectorObj.dateEdit.Year,ENSubst150DisconnectorObj.dateEdit.Month,ENSubst150DisconnectorObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmENSubst150DisconnectorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Disconnector: ENSubst150DisconnectorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubst150DisconnectorFilterObj.name := edtName.Text; 



     ENSubst150DisconnectorFilterObj.factoryNumber := edtFactoryNumber.Text; 



     if (ENSubst150DisconnectorFilterObj.currentNominal = nil ) then
       ENSubst150DisconnectorFilterObj.currentNominal := TXSDecimal.Create;
     if edtCurrentNominal.Text <> '' then
       ENSubst150DisconnectorFilterObj.currentNominal.decimalString := edtCurrentNominal.Text 
     else
       ENSubst150DisconnectorFilterObj.currentNominal := nil;




     ENSubst150DisconnectorFilterObj.commentGen := edtCommentGen.Text; 



     ENSubst150DisconnectorFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSubst150DisconnectorFilterObj.dateEdit = nil then
          ENSubst150DisconnectorFilterObj.dateEdit := TXSDate.Create;
       ENSubst150DisconnectorFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSubst150DisconnectorFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENSubst150DisconnectorFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150DisconnectorFilterObj.element = nil then ENSubst150DisconnectorFilterObj.element := ENElement.Create();
               ENSubst150DisconnectorFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.

unit EditENFuelInventarizationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationController ;

type
  TfrmENFuelInventarizationFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblMolCode : TLabel;
    edtMolCode: TEdit;

    lblMolName : TLabel;
    edtMolName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelInventarization: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuelInventarizationFilterEdit: TfrmENFuelInventarizationFilterEdit;
  ENFuelInventarizationFilterObj: ENFuelInventarizationFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationController  ;
}
{$R *.dfm}



procedure TfrmENFuelInventarizationFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtUserAdd
      ,edtDateAdd
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENFuelInventarizationObj.numberGen; 



      if ENFuelInventarizationObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENFuelInventarizationObj.dateGen.Year,ENFuelInventarizationObj.dateGen.Month,ENFuelInventarizationObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;	  



    edtMolCode.Text := ENFuelInventarizationObj.molCode; 



    edtMolName.Text := ENFuelInventarizationObj.molName; 



    MakeMultiline(edtCommentGen.Lines, ENFuelInventarizationObj.commentGen);



    edtUserAdd.Text := ENFuelInventarizationObj.userAdd; 



      if ENFuelInventarizationObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENFuelInventarizationObj.dateAdd.Year,ENFuelInventarizationObj.dateAdd.Month,ENFuelInventarizationObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENFuelInventarizationObj.userGen; 



      if ENFuelInventarizationObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelInventarizationObj.dateEdit.Year,ENFuelInventarizationObj.dateEdit.Month,ENFuelInventarizationObj.dateEdit.Day);
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



procedure TfrmENFuelInventarizationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuelInventarizationFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateGen.checked then
     begin 
       if ENFuelInventarizationFilterObj.dateGen = nil then
          ENFuelInventarizationFilterObj.dateGen := TXSDateTime.Create;
       ENFuelInventarizationFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENFuelInventarizationFilterObj.dateGen := nil;



     ENFuelInventarizationFilterObj.molCode := edtMolCode.Text; 



     ENFuelInventarizationFilterObj.molName := edtMolName.Text; 



     ENFuelInventarizationFilterObj.commentGen := edtCommentGen.Text; 



     ENFuelInventarizationFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENFuelInventarizationFilterObj.dateAdd = nil then
          ENFuelInventarizationFilterObj.dateAdd := TXSDateTime.Create;
       ENFuelInventarizationFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENFuelInventarizationFilterObj.dateAdd := nil;



     ENFuelInventarizationFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelInventarizationFilterObj.dateEdit = nil then
          ENFuelInventarizationFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelInventarizationFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelInventarizationFilterObj.dateEdit := nil;




  end;
end;




end.
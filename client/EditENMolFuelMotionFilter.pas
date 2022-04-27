
unit EditENMolFuelMotionFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolFuelMotionController ;

type
  TfrmENMolFuelMotionFilterEdit = class(TDialogForm)

    lblMolcode : TLabel;
    edtMolcode: TEdit;

    lblMolname : TLabel;
    edtMolname: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblNn : TLabel;
    edtNn: TEdit;

    lblMat_name : TLabel;
    edtMat_name: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENMolFuelMotion: THTTPRIO;

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
  frmENMolFuelMotionFilterEdit: TfrmENMolFuelMotionFilterEdit;
  ENMolFuelMotionFilterObj: ENMolFuelMotionFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolFuelMotionController  ;
}
{$R *.dfm}



procedure TfrmENMolFuelMotionFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      ,edtNn
      ,edtMat_name
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMolcode.Text := ENMolFuelMotionObj.molcode; 



    edtMolname.Text := ENMolFuelMotionObj.molname; 



      if ENMolFuelMotionObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENMolFuelMotionObj.dateGen.Year,ENMolFuelMotionObj.dateGen.Month,ENMolFuelMotionObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtNn.Text := ENMolFuelMotionObj.nn; 



    edtMat_name.Text := ENMolFuelMotionObj.mat_name; 



    if ( ENMolFuelMotionObj.countGen <> nil ) then
       edtCountGen.Text := ENMolFuelMotionObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtUserGen.Text := ENMolFuelMotionObj.userGen; 



      if ENMolFuelMotionObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENMolFuelMotionObj.dateEdit.Year,ENMolFuelMotionObj.dateEdit.Month,ENMolFuelMotionObj.dateEdit.Day);
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



procedure TfrmENMolFuelMotionFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMolFuelMotionFilterObj.molcode := edtMolcode.Text; 



     ENMolFuelMotionFilterObj.molname := edtMolname.Text; 



     if edtdateGen.checked then
     begin 
       if ENMolFuelMotionFilterObj.dateGen = nil then
          ENMolFuelMotionFilterObj.dateGen := TXSDate.Create;
       ENMolFuelMotionFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENMolFuelMotionFilterObj.dateGen := nil;



     ENMolFuelMotionFilterObj.nn := edtNn.Text; 



     ENMolFuelMotionFilterObj.mat_name := edtMat_name.Text; 



     if (ENMolFuelMotionFilterObj.countGen = nil ) then
       ENMolFuelMotionFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENMolFuelMotionFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENMolFuelMotionFilterObj.countGen := nil;




     ENMolFuelMotionFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENMolFuelMotionFilterObj.dateEdit = nil then
          ENMolFuelMotionFilterObj.dateEdit := TXSDateTime.Create;
       ENMolFuelMotionFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENMolFuelMotionFilterObj.dateEdit := nil;




  end;
end;




end.
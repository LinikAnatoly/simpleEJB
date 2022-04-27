
unit EditENIPFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPController ;

type
  TfrmENIPFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblYearGen : TLabel;
    edtYearGen: TEdit;

    lblVersion : TLabel;
    edtVersion: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblUserEdit : TLabel;
    edtUserEdit: TEdit;

    lblModifytime : TLabel;
    edtModifytime: TDateTimePicker;


  HTTPRIOENIP: THTTPRIO;

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
  frmENIPFilterEdit: TfrmENIPFilterEdit;
  ENIPFilterObj: ENIPFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPController  ;
}
{$R *.dfm}



procedure TfrmENIPFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtYearGen
      ,edtVersion
      ,edtDateAdd
      ,edtDateEdit
      ,edtUserAdd
      ,edtUserEdit
      ,edtModifytime
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENIPObj.name; 



    if ( ENIPObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENIPObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( ENIPObj.version <> Low(Integer) ) then
       edtVersion.Text := IntToStr(ENIPObj.version)
    else
       edtVersion.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENIPObj.commentGen);



      if ENIPObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENIPObj.dateAdd.Year,ENIPObj.dateAdd.Month,ENIPObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



      if ENIPObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENIPObj.dateEdit.Year,ENIPObj.dateEdit.Month,ENIPObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserAdd.Text := ENIPObj.userAdd; 



    edtUserEdit.Text := ENIPObj.userEdit; 



      if ENIPObj.modifytime <> nil then
      begin
        edtModifytime.DateTime:=EncodeDate(ENIPObj.modifytime.Year,ENIPObj.modifytime.Month,ENIPObj.modifytime.Day);
        edtModifytime.checked := true;
      end
      else
      begin
        edtModifytime.DateTime:=SysUtils.Date;
        edtModifytime.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENIPFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIP: ENIPControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENIPFilterObj.name := edtName.Text; 



     if ( edtYearGen.Text <> '' ) then
       ENIPFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENIPFilterObj.yearGen := Low(Integer) ;




     if ( edtVersion.Text <> '' ) then
       ENIPFilterObj.version := StrToInt(edtVersion.Text)
     else
       ENIPFilterObj.version := Low(Integer) ;




     ENIPFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateAdd.checked then
     begin 
       if ENIPFilterObj.dateAdd = nil then
          ENIPFilterObj.dateAdd := TXSDateTime.Create;
       ENIPFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENIPFilterObj.dateAdd := nil;



     if edtdateEdit.checked then
     begin 
       if ENIPFilterObj.dateEdit = nil then
          ENIPFilterObj.dateEdit := TXSDateTime.Create;
       ENIPFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENIPFilterObj.dateEdit := nil;



     ENIPFilterObj.userAdd := edtUserAdd.Text; 



     ENIPFilterObj.userEdit := edtUserEdit.Text; 








  end;
end;




end.
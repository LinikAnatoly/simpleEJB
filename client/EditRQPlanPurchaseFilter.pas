
unit EditRQPlanPurchaseFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPurchaseController ;

type
  TfrmRQPlanPurchaseFilterEdit = class(TDialogForm)

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



  HTTPRIORQPlanPurchase: THTTPRIO;

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
  frmRQPlanPurchaseFilterEdit: TfrmRQPlanPurchaseFilterEdit;
  RQPlanPurchaseFilterObj: RQPlanPurchaseFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPurchaseController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPurchaseFilterEdit.FormShow(Sender: TObject);

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
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQPlanPurchaseObj.name; 



    if ( RQPlanPurchaseObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(RQPlanPurchaseObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( RQPlanPurchaseObj.version <> Low(Integer) ) then
       edtVersion.Text := IntToStr(RQPlanPurchaseObj.version)
    else
       edtVersion.Text := '';



    MakeMultiline(edtCommentGen.Lines, RQPlanPurchaseObj.commentGen);



      if RQPlanPurchaseObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(RQPlanPurchaseObj.dateAdd.Year,RQPlanPurchaseObj.dateAdd.Month,RQPlanPurchaseObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



      if RQPlanPurchaseObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPlanPurchaseObj.dateEdit.Year,RQPlanPurchaseObj.dateEdit.Month,RQPlanPurchaseObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserAdd.Text := RQPlanPurchaseObj.userAdd; 



    edtUserEdit.Text := RQPlanPurchaseObj.userEdit; 


  end;

}

end;



procedure TfrmRQPlanPurchaseFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPlanPurchaseFilterObj.name := edtName.Text; 



     if ( edtYearGen.Text <> '' ) then
       RQPlanPurchaseFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       RQPlanPurchaseFilterObj.yearGen := Low(Integer) ;




     if ( edtVersion.Text <> '' ) then
       RQPlanPurchaseFilterObj.version := StrToInt(edtVersion.Text)
     else
       RQPlanPurchaseFilterObj.version := Low(Integer) ;




     RQPlanPurchaseFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateAdd.checked then
     begin 
       if RQPlanPurchaseFilterObj.dateAdd = nil then
          RQPlanPurchaseFilterObj.dateAdd := TXSDateTime.Create;
       RQPlanPurchaseFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       RQPlanPurchaseFilterObj.dateAdd := nil;



     if edtdateEdit.checked then
     begin 
       if RQPlanPurchaseFilterObj.dateEdit = nil then
          RQPlanPurchaseFilterObj.dateEdit := TXSDateTime.Create;
       RQPlanPurchaseFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQPlanPurchaseFilterObj.dateEdit := nil;



     RQPlanPurchaseFilterObj.userAdd := edtUserAdd.Text; 



     RQPlanPurchaseFilterObj.userEdit := edtUserEdit.Text; 




  end;
end;




end.
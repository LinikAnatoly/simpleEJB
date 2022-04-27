
unit EditENAccess2EnelementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAccess2EnelementController ;

type
  TfrmENAccess2EnelementFilterEdit = class(TDialogForm)

    lblIsAccess : TLabel;
    edtIsAccess: TEdit;



  HTTPRIOENAccess2Enelement: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    Label1: TLabel;
    edtbuhName: TEdit;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPRenClick(Sender: TObject);
  

  private
     renCondition : string;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAccess2EnelementFilterEdit: TfrmENAccess2EnelementFilterEdit;
  ENAccess2EnelementFilterObj: ENAccess2EnelementFilter;

implementation

uses
  ENElementTypeController, ENConsts, ShowENEPRen;


{uses  
    EnergyproController, EnergyproController2, ENAccess2EnelementController  ;
}
{$R *.dfm}



procedure TfrmENAccess2EnelementFilterEdit.FormShow(Sender: TObject);
   var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : Integer;
begin

renCondition := '';

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENAccess2EnelementObj.isAccess <> Low(Integer) ) then
       edtIsAccess.Text := IntToStr(ENAccess2EnelementObj.isAccess)
    else
       edtIsAccess.Text := '';


  end;

}




   cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := 'code not in (' + SQL_NO_SELECTED_ELEMENT_TYPE_FOR_ACCESS + ')';
  f.orderBySQL := 'code';

TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  DisableControls([ edtEPRenName ]);

end;



procedure TfrmENAccess2EnelementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
var
     condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     condition := '';

     if ( edtIsAccess.Text <> '' ) then
       ENAccess2EnelementFilterObj.isAccess := StrToInt(edtIsAccess.Text)
     else
       ENAccess2EnelementFilterObj.isAccess := Low(Integer) ;


     if cbElementType.ItemIndex > -1 then
     begin
       AddCondition(condition, ' ENELEMENT.CODE IN (SELECT CODE FROM ENELEMENT WHERE ENELEMENT.TYPEREFCODE='+IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex]))+') ');
     end;


     if (edtInvNumber.Text <> '' ) then
      AddCondition(condition, ' upper(enelementdata.invnumber) like upper(replace('+''''+ edtInvNumber.Text + '''' + ',''*'',''%'') ) ');

     if (edtName.Text <> '' ) then
      AddCondition(condition, ' upper(enelementdata.ename) like upper(replace('+''''+ edtName.Text + '''' + ',''*'',''%'') ) ');

     if (edtbuhName.Text <> '' ) then
      AddCondition(condition, ' upper(enelementdata.buhname) like upper(replace('+''''+ edtbuhName.Text + '''' + ',''*'',''%'') ) ');

     if renCondition <> '' then
       AddCondition(condition, renCondition);


     if ENAccess2EnelementFilterObj.conditionSQL <> '' then
       ENAccess2EnelementFilterObj.conditionSQL := ENAccess2EnelementFilterObj.conditionSQL + ' and ' + condition
     else
       ENAccess2EnelementFilterObj.conditionSQL := condition;







  end;
end;




procedure TfrmENAccess2EnelementFilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
               renCondition := ' enelement.code in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.
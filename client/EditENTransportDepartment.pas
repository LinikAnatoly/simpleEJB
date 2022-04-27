
unit EditENTransportDepartment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportDepartmentController,
  ExtCtrls, User2StaffingController, AdvObj ;

type
  TfrmENTransportDepartmentEdit = class(TDialogForm)


  HTTPRIOENTransportDepartment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pnlTrnDep: TPanel;
    grpOveral: TGroupBox;
    lblName: TLabel;
    edtName: TMemo;
    edtCode: TEdit;
    lblCode: TLabel;
    grpUsers: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    HTTPRIOENTransportDep2User: THTTPRIO;
    ActionList1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    HTTPRIOUser2Staffing: THTTPRIO;
    sgUser2Staffing: TAdvStringGrid;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportDepartmentEdit: TfrmENTransportDepartmentEdit;
  ENTransportDepartmentObj: ENTransportDepartment;

implementation

uses ShowUser2Staffing, ENTransportDep2UserController, EditENTransportDep2User;


 var
 ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  User2StaffingHeaders: array [1..6] of String =
        ( 'Код користувача'
          ,'Табельний номер'
          ,'П.І.Б. співробітника'
          ,'Посада'
          ,'Підрозділ'
          ,'Цех'
        );



{uses  
    EnergyproController, EnergyproController2, ENTransportDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENTransportDepartmentEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportDepartmentObj.code);
    MakeMultiline(edtName.Lines, ENTransportDepartmentObj.name);

    actUpdateExecute(sender);
  end;
end;



procedure TfrmENTransportDepartmentEdit.actDeleteExecute(Sender: TObject);
Var TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
  userCode, objCode: Integer;
  transportDep2UserFilter : ENTransportDep2UserFilter;
  transportDep2UserList : ENTransportDep2UserShortList;
begin
 TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;

  try
     userCode := StrToInt(sgUser2Staffing.Cells[0,sgUser2Staffing.Row]);
   except
   on EConvertError do Exit;
  end;

    transportDep2UserFilter := ENTransportDep2UserFilter.Create;
    SetNullIntProps(transportDep2UserFilter);
    SetNullXSProps(transportDep2UserFilter);
    transportDep2UserFilter.transportDepartment := ENTransportDepartment.Create;
    transportDep2UserFilter.transportDepartment.code := ENTransportDepartmentObj.code;
    transportDep2UserFilter.userCode := userCode;

    transportDep2UserList := TempENTransportDep2User.getScrollableFilteredList(transportDep2UserFilter,0,-1);
    if transportDep2UserList.totalCount <> 1 then
    begin
        Application.MessageBox(PChar('Для подразделения и пользователя найдено больше одной связки!'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2);
        Exit;
    end;

    objCode :=  TempENTransportDep2User.getObject(transportDep2UserList.list[0].code).code;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка подразделения с юзерами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportDep2User.remove(objCode);
      actUpdateExecute(Sender);
  end;
end;

procedure TfrmENTransportDepartmentEdit.actInsertExecute(Sender: TObject);
var
    frmUser2StaffingShow : TfrmUser2StaffingShow;
    TempENTransportDep2User : ENTransportDep2UserControllerSoapPort;
begin

  TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;
  ENTransportDep2UserObj:=ENTransportDep2User.Create;
  SetNullIntProps(ENTransportDep2UserObj);
  SetNullXSProps(ENTransportDep2UserObj);
  try
    frmUser2StaffingShow := TfrmUser2StaffingShow.Create(Application, fmNormal);
    try
      if frmUser2StaffingShow.ShowModal = mrOk then
      begin
            ENTransportDep2UserObj.userCode := StrToInt(GetReturnValue(frmUser2StaffingShow.sgUser2Staffing,0));
            ENTransportDep2UserObj.transportDepartment := ENTransportDepartment.Create;
            ENTransportDep2UserObj.transportDepartment.code := ENTransportDepartmentObj.code;
            TempENTransportDep2User.add(ENTransportDep2UserObj);
            actUpdateExecute(Sender);
      end;
    finally
      frmUser2StaffingShow.Free;
      frmUser2StaffingShow:=nil;
    end;
  finally
    frmUser2StaffingShow.Free;
  end;
end;

procedure TfrmENTransportDepartmentEdit.actUpdateExecute(Sender: TObject);
Var i, j: Integer;
 TempUser2Staffing: User2StaffingControllerSoapPort;
  User2StaffingList: User2StaffingShortList;
  u2sFilter : User2StaffingFilter;
begin
   for i:=1 to sgUser2Staffing.RowCount-1 do
   for j:=0 to sgUser2Staffing.ColCount-1 do
   begin
     sgUser2Staffing.Cells[j,i]:='';
     if Assigned(sgUser2Staffing.Objects[j,i]) then
     begin
        sgUser2Staffing.Objects[j,i].Free;
        sgUser2Staffing.Objects[j,i]:=nil;
     end;
   end;

  SetGridHeaders(User2StaffingHeaders, sgUser2Staffing.ColumnHeaders);
  ColCount:=100;
  TempUser2Staffing :=  HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;

    u2sFilter := User2StaffingFilter.Create;
    SetNullIntProps(u2sFilter);
    SetNullXSProps(u2sFilter);

    u2sFilter.conditionSQL := ' auth_user.user_code in (select d2u.usercode ' +
                              ' from entransportdep2user d2u ' +
                              ' where d2u.transportdepartmentcod = '+ IntToStr(ENTransportDepartmentObj.code) +')';

  User2StaffingList := TempUser2Staffing.getScrollableFilteredList(u2sFilter,0,ColCount);

  LastCount:=High(User2StaffingList.list);

  if LastCount > -1 then
    sgUser2Staffing.RowCount:=LastCount+2
  else
    sgUser2Staffing.RowCount:=2;

   with sgUser2Staffing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if User2StaffingList.list[i].userCode <> Low(Integer) then
          Cells[0,i+1] := IntToStr(User2StaffingList.list[i].userCode)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := User2StaffingList.list[i].tabNumber;
        Cells[2,i+1] := User2StaffingList.list[i].fio;

        Cells[3,i+1] := User2StaffingList.list[i].postNazv;
        Cells[4,i+1] := User2StaffingList.list[i].podrName;
        Cells[5,i+1] := User2StaffingList.list[i].cehNazv;

        Objects[0,i+1] := User2StaffingList.list[i];

        LastRow:=i+1;
        sgUser2Staffing.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgUser2Staffing.Row:=1;
end;

procedure TfrmENTransportDepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;


     ENTransportDepartmentObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTransportDepartmentObj.code:=low(Integer);
      TempENTransportDepartment.add(ENTransportDepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportDepartment.save(ENTransportDepartmentObj);
    end;
  end;
end;


end.
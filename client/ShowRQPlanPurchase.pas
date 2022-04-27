
unit ShowRQPlanPurchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  RQPlanPurchaseController, AdvObj , EditInsertRQPlanPurchase, EditRQPlanPurchase,
  ExtCtrls, StdCtrls;


type
  TfrmRQPlanPurchaseShow = class(TChildForm)
  HTTPRIORQPlanPurchase: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPurchase: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    sgRQPlanPurchaseChanges: TAdvStringGrid;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ActionListPlanPurchaseChange: TActionList;
    PopupMenuPlanPurchaseChange: TPopupMenu;
    actViewPlanPurchaseChanges: TAction;
    actInsertPlanPurchaseChanges: TAction;
    actDeletePlanPurchaseChanges: TAction;
    actEditPlanPurchaseChanges: TAction;
    actUpdatePlanPurchaseChanges: TAction;
    actFilterPlanPurchaseChanges: TAction;
    actNoFilterPlanPurchaseChanges: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    actApproved: TAction;
    actUnApproved: TAction;
    N10: TMenuItem;
    miApproved: TMenuItem;
    miUnApproved: TMenuItem;
    actApprovedChanges: TAction;
    actUnApprovedChanges: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQPlanPurchaseTopLeftChanged(Sender: TObject);
procedure sgRQPlanPurchaseDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actViewPlanPurchaseChangesExecute(Sender: TObject);
    procedure actUpdatePlanPurchaseChangesExecute(Sender: TObject);
    procedure actInsertPlanPurchaseChangesExecute(Sender: TObject);
    procedure sgRQPlanPurchaseClick(Sender: TObject);
    procedure actDeletePlanPurchaseChangesExecute(Sender: TObject);
    procedure actEditPlanPurchaseChangesExecute(Sender: TObject);
    procedure sgRQPlanPurchaseChangesDblClick(Sender: TObject);
    procedure actApprovedExecute(Sender: TObject);
    procedure actUnApprovedExecute(Sender: TObject);
    procedure actApprovedChangesExecute(Sender: TObject);
    procedure actUnApprovedChangesExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQPlanPurchaseObj: RQPlanPurchase;
 // RQPlanPurchaseFilterObj: RQPlanPurchaseFilter;
  
  
implementation

uses Main,  EditRQPlanPurchaseFilter,
  RQPlanPurchaseKindController, ENConsts;


{$R *.dfm}

var
  //frmRQPlanPurchaseShow : TfrmRQPlanPurchaseShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPurchaseHeaders: array [1..9] of String =
        ( 'Код'
          ,'Найменування Плану закупівель'
          ,'Рік Плану закупівель'
         // ,'Версія Плану закупок'
          ,'Примітка'
          ,'Дата створення плану закупівель '
          ,'Дата зміни річного плану закупівель '
          ,'Користувач, який створив план закупівель'
          ,'Користувач, який вніс зміни до річного плану закупівель'
          ,'Статус'
        );
  RQPlanPurchaseChangesHeaders: array [1..9] of String =
        ( 'Код'
          ,'Найменування зміни до плану закупівель'
          ,'Рік Плану закупівель'
         // ,'Версія Плану закупок'
          ,'Примітка'
          ,'Дата створення плану закупівель '
          ,'Дата зміни строки'
          ,'Користувач, який створив строку '
          ,'Користувач, який вніс зміни строки'
          ,'Статус'
        );
   

procedure TfrmRQPlanPurchaseShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPurchaseShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPurchaseShow.FormShow(Sender: TObject);
var
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  i: Integer;
  RQPlanPurchaseList: RQPlanPurchaseShortList;
  begin
  SetGridHeaders(RQPlanPurchaseHeaders, sgRQPlanPurchase.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPurchase :=  HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;


     FilterObject := RQPlanPurchaseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);


RQPlanPurchaseFilter(FilterObject).kindRef := RQPlanPurchaseKindRef.Create;
RQPlanPurchaseFilter(FilterObject).kindRef.code := ENConsts.RQPLANPURCHASE_KIND_PLAN_PURCHASE;

  RQPlanPurchaseList := TempRQPlanPurchase.getScrollableFilteredList(RQPlanPurchaseFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPurchaseList.list);

  if LastCount > -1 then
     sgRQPlanPurchase.RowCount:=LastCount+2
  else
     sgRQPlanPurchase.RowCount:=2;

   with sgRQPlanPurchase do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPurchaseList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPurchaseList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPurchaseList.list[i].name;
        if RQPlanPurchaseList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(RQPlanPurchaseList.list[i].yearGen);

//        if RQPlanPurchaseList.list[i].version = Low(Integer) then
//          Cells[3,i+1] := ''
//        else
//          Cells[3,i+1] := IntToStr(RQPlanPurchaseList.list[i].version);

        Cells[3,i+1] := RQPlanPurchaseList.list[i].commentGen;

        if RQPlanPurchaseList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateAdd);

        if RQPlanPurchaseList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateEdit);
        Cells[6,i+1] := RQPlanPurchaseList.list[i].userAdd;
        Cells[7,i+1] := RQPlanPurchaseList.list[i].userEdit;
        Cells[8,i+1] := RQPlanPurchaseList.list[i].statusRefName;
        LastRow:=i+1;
        sgRQPlanPurchase.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPurchase.Row:=1;
   actUpdatePlanPurchaseChangesExecute(Sender);
end;

procedure TfrmRQPlanPurchaseShow.sgRQPlanPurchaseTopLeftChanged(Sender: TObject);
var
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPurchaseList: RQPlanPurchaseShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPurchase.TopRow + sgRQPlanPurchase.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPurchase :=  HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
      CurrentRow:=sgRQPlanPurchase.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPurchaseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPurchaseList := TempRQPlanPurchase.getScrollableFilteredList(RQPlanPurchaseFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPurchase.RowCount:=sgRQPlanPurchase.RowCount+100;
  LastCount:=High(RQPlanPurchaseList.list);
  with sgRQPlanPurchase do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPurchaseList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPurchaseList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPlanPurchaseList.list[i].name;
        if RQPlanPurchaseList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(RQPlanPurchaseList.list[i].yearGen);

//        if RQPlanPurchaseList.list[i].version = Low(Integer) then
//          Cells[3,i+CurrentRow] := ''
//        else
//          Cells[3,i+CurrentRow] := IntToStr(RQPlanPurchaseList.list[i].version);

        Cells[3,i+CurrentRow] := RQPlanPurchaseList.list[i].commentGen;
        if RQPlanPurchaseList.list[i].dateAdd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateAdd);
        if RQPlanPurchaseList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateEdit);
        Cells[6,i+CurrentRow] := RQPlanPurchaseList.list[i].userAdd;
        Cells[7,i+CurrentRow] := RQPlanPurchaseList.list[i].userEdit;
        Cells[8,i+CurrentRow] := RQPlanPurchaseList.list[i].statusRefName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPurchase.Row:=CurrentRow-5;
   sgRQPlanPurchase.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPurchaseShow.sgRQPlanPurchaseChangesDblClick(
  Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPurchaseChanges,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewPlanPurchaseChangesExecute(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.sgRQPlanPurchaseClick(Sender: TObject);
begin
  inherited;
    actUpdatePlanPurchaseChangesExecute(Sender);
end;

procedure TfrmRQPlanPurchaseShow.sgRQPlanPurchaseDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPurchase,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPurchase.RowCount-1 do
   for j:=0 to sgRQPlanPurchase.ColCount-1 do
     sgRQPlanPurchase.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPurchaseShow.actViewExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     RQPlanPurchaseObj := TempRQPlanPurchase.getObject(StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPurchaseEdit:=TfrmRQPlanPurchaseEdit.Create(Application, dsView);
  try
    frmRQPlanPurchaseEdit.ShowModal;
  finally
    frmRQPlanPurchaseEdit.Free;
    frmRQPlanPurchaseEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseShow.actViewPlanPurchaseChangesExecute(
  Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     RQPlanPurchaseObj :=
     TempRQPlanPurchase.getObject(StrToInt(sgRQPlanPurchaseChanges.Cells[0,sgRQPlanPurchaseChanges.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPurchaseEdit:=TfrmRQPlanPurchaseEdit.Create(Application, dsView);
  try
    frmRQPlanPurchaseEdit.ShowModal;
  finally
    frmRQPlanPurchaseEdit.Free;
    frmRQPlanPurchaseEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseShow.actDeletePlanPurchaseChangesExecute(
  Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchaseChanges.Cells[0,sgRQPlanPurchaseChanges.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить зміну до плану закупівель?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.remove(ObjCode);
      actUpdatePlanPurchaseChangesExecute(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.actEditExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     RQPlanPurchaseObj := TempRQPlanPurchase.getObject(StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPurchaseEdit:=TfrmRQPlanPurchaseEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPurchaseEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPurchase.save(RQPlanPurchaseObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPurchaseEdit.Free;
    frmRQPlanPurchaseEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseShow.actEditPlanPurchaseChangesExecute(
  Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     RQPlanPurchaseObj :=
     TempRQPlanPurchase.getObject(StrToInt(sgRQPlanPurchaseChanges.Cells[0,sgRQPlanPurchaseChanges.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPurchaseEdit:=TfrmRQPlanPurchaseEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPurchaseEdit.ShowModal= mrOk then
      begin
        actUpdatePlanPurchaseChangesExecute(Sender);
      end;
  finally
    frmRQPlanPurchaseEdit.Free;
    frmRQPlanPurchaseEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseShow.actApprovedChangesExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchaseChanges.Cells[0,sgRQPlanPurchaseChanges.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Затвердити Зміни до плану закупівель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.approved(ObjCode);
      actUpdatePlanPurchaseChangesExecute(Sender);
  end;
end;


procedure TfrmRQPlanPurchaseShow.actApprovedExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Затвердити (План закупівель) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.approved(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (План закупок) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmRQPlanPurchaseShow.actInsertExecute(Sender: TObject);
begin
  RQPlanPurchaseObj := RQPlanPurchase.Create;
  try
    frmRQPlanPurchaseEditInsert:=TfrmRQPlanPurchaseEditInsert.Create(Application, dsInsert);
    frmRQPlanPurchaseEditInsert.kindPlanPurchase := ENConsts.RQPLANPURCHASE_KIND_PLAN_PURCHASE;
    try
      if frmRQPlanPurchaseEditInsert.ShowModal = mrOk then
      begin
        if RQPlanPurchaseObj<>nil then
          UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPurchaseEditInsert.Free;
      frmRQPlanPurchaseEditInsert:=nil;
    end;
  finally
    RQPlanPurchaseObj.Free;
  end;
end;


procedure TfrmRQPlanPurchaseShow.actInsertPlanPurchaseChangesExecute(
  Sender: TObject);
 var
 PurchaseObjCode , year : integer;
begin
  RQPlanPurchaseObj := RQPlanPurchase.Create;
  try

   try
     PurchaseObjCode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
     year := StrToInt(sgRQPlanPurchase.Cells[2,sgRQPlanPurchase.Row]);
    except
     on EConvertError do Exit;
    end;

    frmRQPlanPurchaseEditInsert:=TfrmRQPlanPurchaseEditInsert.Create(Application, dsInsert);
    frmRQPlanPurchaseEditInsert.kindPlanPurchase := ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN;

    frmRQPlanPurchaseEditInsert.parentPlanPurchaseCode:= PurchaseObjCode;
    frmRQPlanPurchaseEditInsert.Caption:= 'Зміни до плану закупок ' + IntToStr(year) + ' року ' ;

    frmRQPlanPurchaseEditInsert.edtCommentGen.Top:= 40;
    frmRQPlanPurchaseEditInsert.lblCommentGen.Top:=40;
    frmRQPlanPurchaseEditInsert.year:= year;
    frmRQPlanPurchaseEditInsert.lblName.Caption:= 'Назва';
    frmRQPlanPurchaseEditInsert.edtYearGen.Visible:= false;
    frmRQPlanPurchaseEditInsert.lblYearGen.Visible:= false;

    try
      if frmRQPlanPurchaseEditInsert.ShowModal = mrOk then
      begin
        if RQPlanPurchaseObj<>nil then
          actUpdatePlanPurchaseChangesExecute(Sender);
      end;
    finally
      frmRQPlanPurchaseEditInsert.Free;
      frmRQPlanPurchaseEditInsert:=nil;
    end;
  finally
    RQPlanPurchaseObj.Free;
  end;
end;


procedure TfrmRQPlanPurchaseShow.actUnApprovedChangesExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchaseChanges.Cells[0,sgRQPlanPurchaseChanges.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Відмінити затвердження змін до плану закупівель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.unapproved(ObjCode);
      actUpdatePlanPurchaseChangesExecute(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.actUnApprovedExecute(Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Відмінити затвердження Плану закупівель) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.unapproved(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPurchaseShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);

end;


procedure TfrmRQPlanPurchaseShow.actUpdatePlanPurchaseChangesExecute(
  Sender: TObject);
Var i, j , planpurchasecode : Integer;
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  RQPlanPurchaseList: RQPlanPurchaseShortList;
begin
 for i:=1 to sgRQPlanPurchaseChanges.RowCount-1 do
   for j:=0 to sgRQPlanPurchaseChanges.ColCount-1 do
     sgRQPlanPurchaseChanges.Cells[j,i]:='';

     try
        planpurchasecode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
     except
        on EConvertError do exit;
     end;

     begin
        SetGridHeaders(RQPlanPurchaseChangesHeaders, sgRQPlanPurchaseChanges.ColumnHeaders);
        ColCount:=10000;
        TempRQPlanPurchase :=  HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;


           FilterObject := RQPlanPurchaseFilter.Create;
           SetNullIntProps(FilterObject);
           SetNullXSProps(FilterObject);


      RQPlanPurchaseFilter(FilterObject).parentRef := RQPlanPurchaseRef.Create;
      RQPlanPurchaseFilter(FilterObject).parentRef.code :=    planpurchasecode;
      RQPlanPurchaseFilter(FilterObject).kindRef := RQPlanPurchaseKindRef.Create;
      RQPlanPurchaseFilter(FilterObject).kindRef.code := ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN;
      RQPlanPurchaseFilter(FilterObject).orderBySQL := ' RQPlanPurchase.dateadd desc  ';
        RQPlanPurchaseList := TempRQPlanPurchase.getScrollableFilteredList(RQPlanPurchaseFilter(FilterObject),0,ColCount);


        LastCount:=High(RQPlanPurchaseList.list);

        if LastCount > -1 then
           sgRQPlanPurchaseChanges.RowCount:=LastCount+2
        else
           sgRQPlanPurchaseChanges.RowCount:=2;

         with sgRQPlanPurchaseChanges do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if RQPlanPurchaseList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQPlanPurchaseList.list[i].code)
              else
              Cells[0,i+1] := '';
              Cells[1,i+1] := RQPlanPurchaseList.list[i].name;
              if RQPlanPurchaseList.list[i].yearGen = Low(Integer) then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := IntToStr(RQPlanPurchaseList.list[i].yearGen);

                Cells[3,i+1] := RQPlanPurchaseList.list[i].commentGen;

              if RQPlanPurchaseList.list[i].dateAdd = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateAdd);

              if RQPlanPurchaseList.list[i].dateEdit = nil then
                Cells[5,i+1] := ''
              else
                Cells[5,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateEdit);
              Cells[6,i+1] := RQPlanPurchaseList.list[i].userAdd;
              Cells[7,i+1] := RQPlanPurchaseList.list[i].userEdit;
              Cells[8,i+1] := RQPlanPurchaseList.list[i].statusRefName;
              LastRow:=i+1;
              sgRQPlanPurchaseChanges.RowCount:=LastRow+1;
            end;
         ColCount:=ColCount+1;
         sgRQPlanPurchaseChanges.Row:=1;
      end;


end;

procedure TfrmRQPlanPurchaseShow.actFilterExecute(Sender: TObject);
begin
{frmRQPlanPurchaseFilterEdit:=TfrmRQPlanPurchaseFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPurchaseFilterObj := RQPlanPurchaseFilter.Create;
    SetNullIntProps(RQPlanPurchaseFilterObj);
    SetNullXSProps(RQPlanPurchaseFilterObj);

    if frmRQPlanPurchaseFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPlanPurchaseFilter.Create;
      FilterObject := RQPlanPurchaseFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPurchaseFilterEdit.Free;
    frmRQPlanPurchaseFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPlanPurchaseShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
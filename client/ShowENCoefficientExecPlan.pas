
unit ShowENCoefficientExecPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCoefficientExecPlanController, TreeList, AdvObj, ExtCtrls ;


type

  TUpdateMode = (umInsert, umEdit, umDelete);

  TfrmENCoefficientExecPlanShow = class(TChildForm)  
  HTTPRIOENCoefficientExecPlan: THTTPRIO;
    ImageList1: TImageList;
    sgENCoefficientExecPlan: TAdvStringGrid;
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
    tvDep: TTreeList;
    HTTPRIOFINExecutor: THTTPRIO;
    Splitter1: TSplitter;

procedure updatesgENCoefficientExecPlan(Sender: TObject);
procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENCoefficientExecPlanTopLeftChanged(Sender: TObject);
procedure sgENCoefficientExecPlanDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure tvDepDblClick(Sender: TObject);
    procedure tvDepClick(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject; updateMode: TUpdateMode);
 end;

//var
 // ENCoefficientExecPlanObj: ENCoefficientExecPlan;
 // ENCoefficientExecPlanFilterObj: ENCoefficientExecPlanFilter;
  
  
implementation

uses Main, EditENCoefficientExecPlan, EditENCoefficientExecPlanFilter,
  FINExecutorController;


{$R *.dfm}

var
  //frmENCoefficientExecPlanShow : TfrmENCoefficientExecPlanShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCoefficientExecPlanHeaders: array [1..4] of String =
        ( 'Код'
          ,'Коефіцієнт'
          ,'Період дії коефіцієнту(місяць,рік)'
          ,'айді підрозділу ФК'
        );
   

procedure TfrmENCoefficientExecPlanShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCoefficientExecPlanShow:=nil;
    inherited;
  end;


procedure TfrmENCoefficientExecPlanShow.updatesgENCoefficientExecPlan(Sender: TObject);
var
  TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
  i: Integer;
  ENCoefficientExecPlanList: ENCoefficientExecPlanShortList;
begin
  sgENCoefficientExecPlan.Clear;
  SetGridHeaders(ENCoefficientExecPlanHeaders, sgENCoefficientExecPlan.ColumnHeaders);
  ColCount:=2000;
  TempENCoefficientExecPlan :=  HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCoefficientExecPlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoefficientExecPlanFilter(FilterObject).orderBySQL := ' ENCOEFFICIENTEXECPLAN.DATEGEN DESC, ENCOEFFICIENTEXECPLAN.CODE DESC ';
  ENCoefficientExecPlanFilter(FilterObject).finPodrCode :=  FINExecutorShort(tvDep.Selected.Data).finCode;
  ENCoefficientExecPlanFilter(FilterObject).axOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;


  ENCoefficientExecPlanList := TempENCoefficientExecPlan.getScrollableFilteredList(ENCoefficientExecPlanFilter(FilterObject),0,ColCount);



  LastCount:=High(ENCoefficientExecPlanList.list);

  if LastCount > -1 then
     sgENCoefficientExecPlan.RowCount:=LastCount+2
  else
     sgENCoefficientExecPlan.RowCount:=2;

   with sgENCoefficientExecPlan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoefficientExecPlanList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCoefficientExecPlanList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENCoefficientExecPlanList.list[i].coefficient = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENCoefficientExecPlanList.list[i].coefficient.DecimalString;

        if ENCoefficientExecPlanList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithoutTime2String(ENCoefficientExecPlanList.list[i].dateGen);



        if ENCoefficientExecPlanList.list[i].finPodrCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENCoefficientExecPlanList.list[i].finPodrCode);

        LastRow:=i+1;
        sgENCoefficientExecPlan.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCoefficientExecPlan.Row:=1;
end;

procedure TfrmENCoefficientExecPlanShow.FormShow(Sender: TObject);
var
  TempFINExecutor: FINExecutorControllerSoapPort;
  ii: Integer;
  FINExecutorList: FINExecutorShortList;
  finExecFilter : FINExecutorFilter;
  begin


  TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;


  finExecFilter := FINExecutorFilter.Create;
  SetNullIntProps(finExecFilter);
  SetNullXSProps(finExecFilter);
  finExecFilter.finCehCode := StrToInt('1');
  //FINExecutorFilter(FilterObject).conditionSQL := 'p.Main_Podr_Id = 1'; // ХОЕ




  FINExecutorList := TempFINExecutor.getFINExecutorList(finExecFilter,0,-1);

  tvDep.Items.Clear;

   for ii:=0 to High(FINExecutorList.list) do
      begin
        ///////
        tvDep.Items.AddChild(nil, FINExecutorList.list[ii].name + ';;;;;' + FINExecutorList.list[ii].finKindName ).Data := FINExecutorList.list[ii];
      end;



end;

procedure TfrmENCoefficientExecPlanShow.sgENCoefficientExecPlanTopLeftChanged(Sender: TObject);
var
  TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
  i,CurrentRow: Integer;
  ENCoefficientExecPlanList: ENCoefficientExecPlanShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCoefficientExecPlan.TopRow + sgENCoefficientExecPlan.VisibleRowCount) = ColCount
  then
    begin
      TempENCoefficientExecPlan :=  HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;
      CurrentRow:=sgENCoefficientExecPlan.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCoefficientExecPlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoefficientExecPlanList := TempENCoefficientExecPlan.getScrollableFilteredList(ENCoefficientExecPlanFilter(FilterObject),ColCount-1, 100);



  sgENCoefficientExecPlan.RowCount:=sgENCoefficientExecPlan.RowCount+100;
  LastCount:=High(ENCoefficientExecPlanList.list);
  with sgENCoefficientExecPlan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoefficientExecPlanList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCoefficientExecPlanList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENCoefficientExecPlanList.list[i].coefficient = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENCoefficientExecPlanList.list[i].coefficient.DecimalString;
        if ENCoefficientExecPlanList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENCoefficientExecPlanList.list[i].dateGen);		  
        if ENCoefficientExecPlanList.list[i].finPodrCode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENCoefficientExecPlanList.list[i].finPodrCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCoefficientExecPlan.Row:=CurrentRow-5;
   sgENCoefficientExecPlan.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCoefficientExecPlanShow.tvDepClick(Sender: TObject);
begin
  //inherited;
 	//UpdateGrid(Sender, umEdit);
  updatesgENCoefficientExecPlan(Sender);
end;

procedure TfrmENCoefficientExecPlanShow.tvDepDblClick(Sender: TObject);
var
  c: FINExecutorControllerSoapPort;
  i: Integer;
  FINExecutorList, tempList : FINExecutorShortList;

  f , f1 : FINExecutorFilter;
  tn : TTreeNode;
  kindName: String;
begin
  if tvDep.Selected = nil then Exit;
  if tvDep.Selected.Data = nil then Exit;

   c := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   f := FINExecutorFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.conditionSQL := ' p.Main_Podr_Id = ' + IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode) ;

   f.finCehCode := FINExecutorShort(tvDep.Selected.Data).finCode;

   // MDAX-441
   f.axParentOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;

   f.orderBySQL := 'p.Nazv';

   tvDep.Selected.DeleteChildren;

  FINExecutorList := c.getFINExecutorList(f,0, -1);

  for i:=0 to High(FINExecutorList.list) do
  begin
          if FINExecutorList.list[i].axOrgId <> '' then
           kindName := FINExecutorList.list[i].axOrgTypeName
         else
           kindName := FINExecutorList.list[i].finKindName;

         //tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + FINExecutorList.list[i].finKindName);
         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));
         tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + kindName);

         tn.Data := FINExecutorList.list[i];

         f1 := FINExecutorFilter.Create;
         SetNullIntProps(f1);
         SetNullXSProps(f1);

         //f1.conditionSQL := ' p.Main_Podr_Id = ' + intToStr(FINExecutorList.list[i].finCode) ;

         f1.finCehCode := FINExecutorList.list[i].finCode;

         f1.axParentOrgId := FINExecutorList.list[i].axOrgId;

         tempList := c.getFINExecutorList(f1,0, -1);

         tn.HasChildren := tempList.totalCount > 0;
  end;
  tvDep.Selected.Expand(false);

end;

procedure TfrmENCoefficientExecPlanShow.sgENCoefficientExecPlanDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCoefficientExecPlan,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCoefficientExecPlanShow.UpdateGrid(Sender: TObject ; updateMode : TUpdateMode );
Var i, j: Integer;
begin
// for i:=1 to sgENCoefficientExecPlan.RowCount-1 do
//   for j:=0 to sgENCoefficientExecPlan.ColCount-1 do
//     sgENCoefficientExecPlan.Cells[j,i]:='';
   // FormShow(Sender);

   if tvDep.Selected <> nil then
    begin
      if updateMode in [umEdit, umDelete] then
            if tvDep.Selected.Parent <> nil then
            begin
              tvDep.Selected.Parent.DeleteChildren;
            end;

       tvDep.Selected.DeleteChildren;
       tvDepDblClick(Sender );
       tvDep.Selected.Expand(false);
    end;
   updatesgENCoefficientExecPlan(Sender);
end;

procedure TfrmENCoefficientExecPlanShow.actViewExecute(Sender: TObject);
Var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
begin
 TempENCoefficientExecPlan := HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;
   try
     ENCoefficientExecPlanObj := TempENCoefficientExecPlan.getObject(StrToInt(sgENCoefficientExecPlan.Cells[0,sgENCoefficientExecPlan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCoefficientExecPlanEdit:=TfrmENCoefficientExecPlanEdit.Create(Application, dsView);
  frmENCoefficientExecPlanEdit.lblFinCehName.Caption:= FINExecutorShort(tvDep.Selected.Data).name;
  try
    frmENCoefficientExecPlanEdit.ShowModal;
  finally
    frmENCoefficientExecPlanEdit.Free;
    frmENCoefficientExecPlanEdit:=nil;
  end;
end;

procedure TfrmENCoefficientExecPlanShow.actEditExecute(Sender: TObject);
Var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
begin
 TempENCoefficientExecPlan := HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;
   try
     ENCoefficientExecPlanObj := TempENCoefficientExecPlan.getObject(StrToInt(sgENCoefficientExecPlan.Cells[0,sgENCoefficientExecPlan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCoefficientExecPlanEdit:=TfrmENCoefficientExecPlanEdit.Create(Application, dsEdit);
  frmENCoefficientExecPlanEdit.lblFinCehName.Caption:= FINExecutorShort(tvDep.Selected.Data).name;
  try
    if frmENCoefficientExecPlanEdit.ShowModal= mrOk then
      begin
        //TempENCoefficientExecPlan.save(ENCoefficientExecPlanObj);
				UpdateGrid(Sender, umEdit);
      end;
  finally
    frmENCoefficientExecPlanEdit.Free;
    frmENCoefficientExecPlanEdit:=nil;
  end;
end;

procedure TfrmENCoefficientExecPlanShow.actDeleteExecute(Sender: TObject);
Var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCoefficientExecPlan := HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCoefficientExecPlan.Cells[0,sgENCoefficientExecPlan.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Коефіцієнт виконання планів за звітний місяць за підрозділами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCoefficientExecPlan.remove(ObjCode);
      UpdateGrid(Sender, umEdit);
  end;
end;

procedure TfrmENCoefficientExecPlanShow.actInsertExecute(Sender: TObject);
// Var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort; 
begin
  // TempENCoefficientExecPlan := HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCoefficientExecPlanObj:=ENCoefficientExecPlan.Create;

   //ENCoefficientExecPlanObj.coefficient:= TXSDecimal.Create;
   //ENCoefficientExecPlanObj.dateGen:= TXSDateTime.Create;
   

   ENCoefficientExecPlanObj.finPodrCode := FINExecutorShort(tvDep.Selected.Data).finCode;
   ENCoefficientExecPlanObj.axOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;


  try
    frmENCoefficientExecPlanEdit:=TfrmENCoefficientExecPlanEdit.Create(Application, dsInsert);
    frmENCoefficientExecPlanEdit.edtDateGen.DateTime := Date;

    frmENCoefficientExecPlanEdit.lblFinCehName.Caption:= FINExecutorShort(tvDep.Selected.Data).name;


    try
      if frmENCoefficientExecPlanEdit.ShowModal = mrOk then
      begin
        if ENCoefficientExecPlanObj<>nil then
            //TempENCoefficientExecPlan.add(ENCoefficientExecPlanObj);
				UpdateGrid(Sender, umEdit);
      end;
    finally
      frmENCoefficientExecPlanEdit.Free;
      frmENCoefficientExecPlanEdit:=nil;
    end;
  finally
    ENCoefficientExecPlanObj.Free;
  end;
end;

procedure TfrmENCoefficientExecPlanShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender, umEdit);
end;


procedure TfrmENCoefficientExecPlanShow.actFilterExecute(Sender: TObject);
begin
{frmENCoefficientExecPlanFilterEdit:=TfrmENCoefficientExecPlanFilterEdit.Create(Application, dsInsert);
  try
    ENCoefficientExecPlanFilterObj := ENCoefficientExecPlanFilter.Create;
    SetNullIntProps(ENCoefficientExecPlanFilterObj);
    SetNullXSProps(ENCoefficientExecPlanFilterObj);

    if frmENCoefficientExecPlanFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCoefficientExecPlanFilter.Create;
      FilterObject := ENCoefficientExecPlanFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCoefficientExecPlanFilterEdit.Free;
    frmENCoefficientExecPlanFilterEdit:=nil;
  end;}
end;

procedure TfrmENCoefficientExecPlanShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender,umEdit);
end;

end.